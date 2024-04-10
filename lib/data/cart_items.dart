List<CartProduct> cartItems = [];

class CartProduct {
  final String name;
  final double price;
  final String imageUrl;
  final int quantitiy;

  CartProduct(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantitiy});
}
