class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.imageUrl, required this.price});
}

final List<Product> products = [
  Product(
    name: 'Peach 1Kg',
    imageUrl: 'assets/vegetables/aadu.jpg',
    price: 50.0,
  ),
  Product(
    name: 'Green Chillie 1Kg',
    imageUrl: 'assets/vegetables/acharimirch.jpg',
    price: 30,
  ),
  Product(
    name: 'Pomegranate 1Kg.',
    imageUrl: 'assets/vegetables/anaar.jpg',
    price: 100,
  ),
  Product(
    name: 'Apple  1Kg',
    imageUrl: 'assets/vegetables/apple.jpg',
    price: 120,
  ),
  Product(
    name: 'Banana',
    imageUrl: 'assets/vegetables/banana.jpg',
    price: 60,
  ),
  Product(
    name: 'Cabbage 1KG',
    imageUrl: 'assets/vegetables/bandgobhi.jpg',
    price: 50,
  ),
  Product(
    name: 'Cake 1Pound',
    imageUrl: 'assets/vegetables/cake.jpg',
    price: 399,
  ),
  Product(
    name: 'Carrot  1Kg',
    imageUrl: 'assets/vegetables/caroot.jpg',
    price: 49,
  ),
  Product(
    name: 'Cauliflower-1Kg',
    imageUrl: 'assets/vegetables/Cauliflower.jpg',
    price: 70,
  ),
  Product(
    name: 'Grapes-  1kg',
    imageUrl: 'assets/vegetables/grapes.jpg',
    price: 80,
  ),
  Product(
    name: 'Mango  1Kg',
    imageUrl: 'assets/vegetables/mango.jpg',
    price: 250,
  )
];
