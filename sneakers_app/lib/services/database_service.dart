import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/cart_item.dart';
import '../models/order_model.dart';
import '../models/shoe_model.dart';
import '../models/user_model.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'sneaker_app.db');
    print('Initializing database at: $path');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print('Creating database tables...');
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT
          )
        ''');
        print('Created table: users');
        await db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            name TEXT,
            price TEXT,
            description TEXT,
            imagePath TEXT,
            quantity INTEGER,
            FOREIGN KEY (userId) REFERENCES users(id)
          )
        ''');
        print('Created table: cart');
        await db.execute('''
          CREATE TABLE orders (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            totalPrice REAL,
            orderDate TEXT,
            FOREIGN KEY (userId) REFERENCES users(id)
          )
        ''');
        print('Created table: orders');
        await db.execute('''
          CREATE TABLE order_items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            orderId INTEGER,
            name TEXT,
            price TEXT,
            description TEXT,
            imagePath TEXT,
            quantity INTEGER,
            FOREIGN KEY (orderId) REFERENCES orders(id)
          )
        ''');
        print('Created table: order_items');
      },
    );
  }

  Future<void> initDatabase() async {
    await database;
    print('Database initialized');
  }

  Future<UserModel?> getUser(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    print('Queried user: $username, found: ${maps.isNotEmpty}');
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }

  Future<bool> registerUser(String username, String password) async {
    final db = await database;
    try {
      await db.insert(
        'users',
        {'username': username, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
      print('User registered: $username');
      return true;
    } catch (e) {
      print('Failed to register user: $username, error: $e');
      return false;
    }
  }

  Future<void> addToCart(int userId, ShoeModel shoe) async {
    final db = await database;
    final existing = await db.query(
      'cart',
      where: 'userId = ? AND name = ?',
      whereArgs: [userId, shoe.name],
    );
    if (existing.isNotEmpty) {
      await db.update(
        'cart',
        {
          'quantity': (existing.first['quantity'] as int) + 1,
        },
        where: 'userId = ? AND name = ?',
        whereArgs: [userId, shoe.name],
      );
      print('Updated cart item: ${shoe.name} for userId: $userId, new quantity: ${(existing.first['quantity'] as int) + 1}');
    } else {
      await db.insert('cart', {
        'userId': userId,
        'name': shoe.name,
        'price': shoe.price,
        'description': shoe.description,
        'imagePath': shoe.imagePath,
        'quantity': 1,
      });
      print('Added new item to cart: ${shoe.name} for userId: $userId');
    }
  }

  Future<void> removeFromCart(int userId, ShoeModel shoe) async {
    final db = await database;
    await db.delete(
      'cart',
      where: 'userId = ? AND name = ?',
      whereArgs: [userId, shoe.name],
    );
    print('Removed item from cart: ${shoe.name} for userId: $userId');
  }

  Future<void> decrementCartItem(int userId, ShoeModel shoe) async {
    final db = await database;
    final existing = await db.query(
      'cart',
      where: 'userId = ? AND name = ?',
      whereArgs: [userId, shoe.name],
    );
    if (existing.isNotEmpty) {
      final quantity = existing.first['quantity'] as int;
      if (quantity > 1) {
        await db.update(
          'cart',
          {'quantity': quantity - 1},
          where: 'userId = ? AND name = ?',
          whereArgs: [userId, shoe.name],
        );
        print('Decremented cart item: ${shoe.name} for userId: $userId, new quantity: ${quantity - 1}');
      } else {
        await removeFromCart(userId, shoe);
      }
    }
  }

  Future<List<CartItem>> getCartItems(int userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cart',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    print('Retrieved ${maps.length} cart items for userId: $userId');
    return List.generate(maps.length, (i) => CartItem.fromMap(maps[i]));
  }

  Future<void> saveOrder(int userId, List<CartItem> items) async {
    final db = await database;
    final totalPrice = items.fold<double>(
        0, (sum, item) => sum + (double.tryParse(item.shoe.price) ?? 0) * item.quantity);
    final orderId = await db.insert('orders', {
      'userId': userId,
      'totalPrice': totalPrice,
      'orderDate': DateTime.now().toIso8601String(),
    });
    print('Saved order ID: $orderId for userId: $userId, total: $totalPrice');
    for (var item in items) {
      await db.insert('order_items', {
        'orderId': orderId,
        'name': item.shoe.name,
        'price': item.shoe.price,
        'description': item.shoe.description,
        'imagePath': item.shoe.imagePath,
        'quantity': item.quantity,
      });
      print('Saved order item: ${item.shoe.name} for orderId: $orderId');
    }
  }

  Future<List<OrderModel>> getOrders(int userId) async {
    final db = await database;
    final orderMaps = await db.query(
      'orders',
      where: 'userId = ?',
      whereArgs: [userId],
      orderBy: 'orderDate ASC',
    );
    print('Retrieved ${orderMaps.length} orders for userId: $userId');
    final List<OrderModel> orders = [];
    for (var i = 0; i < orderMaps.length; i++) {
      final orderMap = orderMaps[i];
      final items = await db.query(
        'order_items',
        where: 'orderId = ?',
        whereArgs: [orderMap['id']],
      );
      final cartItems = List.generate(items.length, (j) => CartItem.fromMap(items[j]));
      print('Retrieved ${items.length} items for orderId: ${orderMap['id']}, displayOrderNumber: ${i + 1}');
      orders.add(OrderModel.fromMap(orderMap, cartItems, i + 1));
    }
    return orders;
  }

  Future<void> clearCart(int userId) async {
    final db = await database;
    await db.delete('cart', where: 'userId = ?', whereArgs: [userId]);
    print('Cleared cart for userId: $userId');
  }

  /// UN_COMMENT THE BELOW FUNTION IF YOU WANT TO SEE THE DATABASE TABLES AND THERE DETAILS
  /// AFTER IT YOU NEED TO UNCOMMENT THE CODE ON SETTINGS VIEW AND SETTINGS VIEWMODEL

  // Future<List<Map<String, dynamic>>> showTables() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> tables = await db.rawQuery(
  //     "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';",
  //   );
  //   final tableNames = tables.map((table) => table['name'] as String).toList();
  //   final List<Map<String, dynamic>> tableDetails = [];
  //
  //   print('Database tables: $tableNames');
  //   for (var tableName in tableNames) {
  //     final List<Map<String, dynamic>> columns = await db.rawQuery('PRAGMA table_info($tableName);');
  //     print('Table: $tableName');
  //     print('Columns:');
  //     for (var column in columns) {
  //       print('  ${column['name']} (${column['type']})');
  //     }
  //     tableDetails.add({
  //       'tableName': tableName,
  //       'columns': columns.map((col) => {
  //         'name': col['name'],
  //         'type': col['type'],
  //       }).toList(),
  //     });
  //   }
  //   return tableDetails;
  // }
  //
  // Future<void> logAllTableData() async {
  //   final db = await database;
  //
  //   // Get all user-defined table names
  //   final tables = await db.rawQuery(
  //     "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';",
  //   );
  //
  //   for (var table in tables) {
  //     final tableName = table['name'] as String;
  //     print('--- Contents of table: $tableName ---');
  //
  //     // Get all rows from the table
  //     final rows = await db.query(tableName);
  //
  //     if (rows.isEmpty) {
  //       print('  (no rows)');
  //     } else {
  //       for (var row in rows) {
  //         print('  $row');
  //       }
  //     }
  //
  //     print('\n');
  //   }
  // }

}