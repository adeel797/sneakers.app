import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../app/app.locator.dart';
import '../models/user_model.dart';
import 'database_service.dart';

class AuthService {
  final _databaseService = locator<DatabaseService>();
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  Future<UserModel?> login(String username, String password) async {
    final hashedPassword = _hashPassword(password);
    final user = await _databaseService.getUser(username, hashedPassword);
    if (user != null) {
      _currentUser = user;
    }
    return user;
  }

  Future<bool> register(String username, String password) async {
    final hashedPassword = _hashPassword(password);
    final success = await _databaseService.registerUser(username, hashedPassword);
    if (success) {
      _currentUser = await _databaseService.getUser(username, hashedPassword);
    }
    return success;
  }

  void logout() {
    _currentUser = null;
  }

  String _hashPassword(String password) {
    return md5.convert(utf8.encode(password)).toString();
  }
}