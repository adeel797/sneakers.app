class ShoeModel {
  final String name;
  final String price;
  final String description;
  final String imagePath;

  ShoeModel({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  factory ShoeModel.fromMap(Map<String, dynamic> map) {
    return ShoeModel(
      name: map['name'] as String,
      price: map['price'] as String,
      description: map['description'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imagePath': imagePath,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ShoeModel &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              price == other.price &&
              description == other.description &&
              imagePath == other.imagePath;

  @override
  int get hashCode =>
      name.hashCode ^ price.hashCode ^ description.hashCode ^ imagePath.hashCode;
}
