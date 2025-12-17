class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.image,
  });
}
