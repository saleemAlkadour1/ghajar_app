class CartItemModel {
  final String name;

  final int price;

  final String? imagePath;

  int quantity;
  CartItemModel({
    required this.name,
    required this.price,
    this.imagePath,
    required this.quantity,
  });
}
