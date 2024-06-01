import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category; 
  final String? description;
  Product(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.category, 
      this.description});
}

List<Product> products = [
  Product(
    name: 'Green Chillie 1Kg',
    imageUrl: 'https://kumaribasket.com/wp-content/uploads/2020/07/Green-chilli-02-1200x675.jpg',
    price: 30,
    category: 'vegetable',
    description: "Fresh green chilies, 1Kg pack, perfect for adding spice to your dishes. These chilies are sourced from local farms ensuring high quality. They are rich in vitamins and antioxidants. Ideal for making spicy sauces and curries."
  ),
  Product(
    name: 'Pomegranate 1Kg',
    imageUrl: 'https://m.media-amazon.com/images/I/611a1wD9ZGL.jpg',
    price: 100,
    category: 'fruit',
    description: "Juicy and sweet pomegranates, 1Kg, rich in antioxidants. These pomegranates are perfect for snacking or adding to salads and desserts. They are known for their high vitamin C content. Great for boosting your immune system."
  ),
  Product(
    name: 'Apple 1Kg',
    imageUrl: 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg',
    price: 120,
    category: 'fruit',
    description: "Crisp and delicious apples, 1Kg, perfect for snacking. These apples are handpicked from the best orchards. They are a great source of fiber and vitamins. Ideal for eating fresh, making apple pies, or juicing."
  ),
  Product(
    name: 'Banana 1Kg',
    imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2022/12/EK/NP/CN/49293026/fresh-banana-fruit.webp',
    price: 60,
    category: 'fruit',
    description: "Ripe bananas, 1Kg, a great source of energy and potassium. These bananas are perfect for smoothies, baking, or eating on their own. They are known for their creamy texture and sweet taste. Ideal for a quick snack on the go."
  ),
  Product(
    name: 'Cabbage 1Kg',
    imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSlSmMQmoGhFnckZYMqmw7jMfr6xdBRVHpsd-PrU0D1UFa3_NB0',
    price: 50,
    category: 'vegetable',
    description: "Fresh cabbage, 1Kg, perfect for salads and stir-fries. This cabbage is crisp and full of nutrients. It is a great source of vitamin K and C. Ideal for making coleslaw, soups, and stews."
  ),
  Product(
    name: 'Cake 1Pound',
    imageUrl: 'https://media.istockphoto.com/id/1339241159/photo/set-of-different-delicious-cakes-isolated-on-white.jpg?s=612x612&w=0&k=20&c=i_OmAnqVaTFODI2f7DlCj45gKTSg01RfRrLY8_FC6E4=',
    price: 399,
    category: 'grocery',
    description: "Delicious 1-pound cake, ideal for celebrations and dessert. This cake is baked to perfection with high-quality ingredients. It is soft, moist, and full of flavor. Perfect for birthdays, anniversaries, and other special occasions."
  ),
  Product(
    name: 'Carrot 1Kg',
    imageUrl: 'https://img.etimg.com/thumb/width-1200,height-900,imgsize-15352,resizemode-75,msid-11581218/explore-with-carrots-as-the-vegetable-can-grace-the-most-interesting-of-menus.jpg',
    price: 49,
    category: 'vegetable',
    description: "Fresh carrots, 1Kg, perfect for snacking and cooking. These carrots are crunchy and sweet. They are a great source of beta-carotene and fiber. Ideal for salads, soups, and stir-fries."
  ),
  Product(
    name: 'Cauliflower 1Kg',
    imageUrl: 'https://www.plantsnplanters.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/C/a/Cauliflower-seeds-_Open-Pollinated_.png',
    price: 70,
    category: 'vegetable',
    description: "Fresh cauliflower, 1Kg, great for roasting and steaming. This cauliflower is packed with vitamins and minerals. It has a mild flavor and firm texture. Perfect for making cauliflower rice, soups, and casseroles."
  ),
  Product(
    name: 'Grapes 1Kg',
    imageUrl: 'https://farmfreshfundraising.com/wp-content/uploads/2017/10/271156-grapes.jpg',
    price: 80,
    category: 'fruit',
    description: "Sweet and juicy grapes, 1Kg, perfect for snacking. These grapes are fresh and full of flavor. They are a great source of vitamins and antioxidants. Ideal for eating fresh, adding to salads, or making juice."
  ),
  Product(
    name: 'Mango 1Kg',
    imageUrl: 'https://m.media-amazon.com/images/I/517d7TVk+bL._AC_UF1000,1000_QL80_.jpg',
    price: 250,
    category: 'fruit',
    description: "Sweet and delicious mangoes, 1Kg, great for desserts and smoothies. These mangoes are handpicked and full of flavor. They are rich in vitamins A and C. Perfect for making mango salsa, smoothies, and desserts."
  ),
  Product(
    name: 'Bread 1Pkt',
    imageUrl: 'https://thumbs.dreamstime.com/b/bread-cut-14027607.jpg',
    price: 25,
    category: 'grocery',
    description: "Freshly baked bread, 1 packet, perfect for sandwiches and toast. This bread is soft, fluffy, and delicious. It is made with high-quality ingredients. Ideal for making sandwiches, toast, and bread pudding."
  ),
  Product(
    name: 'Cookies 1Pkt',
    imageUrl: 'https://m.media-amazon.com/images/I/81EgwRfgLiL._AC_UF1000,1000_QL80_.jpg',
    price: 99,
    category: 'grocery',
    description: "Delicious cookies, 1 packet, a perfect treat for any time. These cookies are baked to perfection with high-quality ingredients. They are crunchy on the outside and soft on the inside. Ideal for snacking, tea time, and parties."
  ),
  Product(
    name: 'Haldiram 1Kg',
    imageUrl: 'https://m.media-amazon.com/images/I/81khBWglt5L.jpg',
    price: 140,
    category: 'grocery',
    description: "Haldiram snacks, 1Kg, great for parties and gatherings. These snacks are crispy, spicy, and full of flavor. They are made with high-quality ingredients. Perfect for serving at parties, family gatherings, and as a tea-time snack."
  ),
  Product(
    name: 'Coconut Oil 250ml',
    imageUrl: 'https://www.bigbasket.com/media/uploads/p/l/40033680-2_5-parachute-advansed-aloe-vera-enriched-coconut-hair-oil.jpg',
    price: 120,
    category: 'grocery',
    description: "Pure coconut oil, 250ml, ideal for cooking and hair care. This oil is extracted from fresh coconuts and is rich in nutrients. It is great for cooking, baking, and frying. Also ideal for nourishing and moisturizing hair."
  ),
  Product(
    name: 'Cashew 250gm',
    imageUrl: 'https://m.media-amazon.com/images/I/812eMu9Ca1L._AC_UF1000,1000_QL80_.jpg',
    price: 220,
    category: 'grocery',
    description: "Premium cashews, 250gm, a healthy and tasty snack. These cashews are crunchy and full of flavor. They are a great source of protein and healthy fats. Ideal for snacking, baking, and adding to dishes."
  ),
  Product(
    name: 'Dettol (125gm*4)',
    imageUrl: 'https://m.media-amazon.com/images/I/61LN2W9ShzL.jpg',
    price: 310,
    category: 'grocery',
    description: "Dettol soap pack, 4 bars of 125gm each, for effective hygiene. These soaps are antibacterial and provide long-lasting protection. They are gentle on the skin and have a pleasant fragrance. Ideal for daily use for maintaining cleanliness and hygiene."
  ),
  Product(
    name: 'Surf-Excel 1Kg',
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2021/8/JZ/HC/FZ/27715606/surf-excel-easy-wash-1kg.jpg',
    price: 250,
    category: 'grocery',
    description: "SurfExcel detergent, 1Kg, for superior cleaning.",
  ),
  Product(
    name: 'Basmati Rice 1Kg',
    imageUrl:
        'https://5.imimg.com/data5/SELLER/Default/2022/11/WN/RU/DG/82381919/bopp-basmati-rice-packaging-bag.jpg',
    price: 125,
    category: 'grocery',
    description: "Premium basmati rice, 1Kg, perfect for flavorful dishes.",
  ),
  Product(
    name: 'Facewash 100ml',
    imageUrl:
        'https://assets.ajio.com/medias/sys_master/root/20230317/8sUg/6414a958f997dde6f4077a9b/-473Wx593H-4904029960-multi-MODEL.jpg',
    price: 170,
    category: 'grocery',
    description: "Refreshing facewash, 100ml, for clear and glowing skin.",
  ),
];
