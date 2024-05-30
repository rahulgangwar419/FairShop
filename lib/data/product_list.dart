import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category; // Added category field

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category, // Initialize category
  });
}

List<Product> products = [
  Product(
    name: 'Green Chillie 1Kg',
    imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2020/10/XM/FQ/IQ/113062273/green-chillies.png',
    price: 30,
    category: 'vegetable', // Added category
  ),
  Product(
    name: 'Pomegranate 1Kg.',
    imageUrl: 'https://images.healthshots.com/healthshots/en/uploads/2021/09/27184641/pomegranate-1600x900.jpg',
    price: 100,
    category: 'fruit', // Added category
  ),
  Product(
    name: 'Apple  1Kg',
    imageUrl: 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg',
    price: 120,
    category: 'fruit', // Added category
  ),
  Product(
    name: 'Banana 1Kg',
    imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2022/12/EK/NP/CN/49293026/fresh-banana-fruit.webp',
    price: 60,
    category: 'fruit', // Added category
  ),
  Product(
    name: 'Cabbage 1KG',
    imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSlSmMQmoGhFnckZYMqmw7jMfr6xdBRVHpsd-PrU0D1UFa3_NB0',
    price: 50,
    category: 'vegetable', // Added category
  ),
  Product(
    name: 'Cake 1Pound',
    imageUrl: 'https://media.istockphoto.com/id/1339241159/photo/set-of-different-delicious-cakes-isolated-on-white.jpg?s=612x612&w=0&k=20&c=i_OmAnqVaTFODI2f7DlCj45gKTSg01RfRrLY8_FC6E4=',
    price: 399,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Carrot  1Kg',
    imageUrl: 'https://img.etimg.com/thumb/width-1200,height-900,imgsize-15352,resizemode-75,msid-11581218/explore-with-carrots-as-the-vegetable-can-grace-the-most-interesting-of-menus.jpg',
    price: 49,
    category: 'vegetable', // Added category
  ),
  Product(
    name: 'Cauliflower-1Kg',
    imageUrl: 'https://www.plantsnplanters.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/C/a/Cauliflower-seeds-_Open-Pollinated_.png',
    price: 70,
    category: 'vegetable', // Added category
  ),
  Product(
    name: 'Grapes-  1kg',
    imageUrl: 'https://farmfreshfundraising.com/wp-content/uploads/2017/10/271156-grapes.jpg',
    price: 80,
    category: 'fruit', // Added category
  ),
  Product(
    name: 'Mango  1Kg',
    imageUrl: 'https://m.media-amazon.com/images/I/517d7TVk+bL._AC_UF1000,1000_QL80_.jpg',
    price: 250,
    category: 'fruit', // Added category
  ),
  Product(
    name: 'Bread  1Pkt',
    imageUrl: 'https://thumbs.dreamstime.com/b/bread-cut-14027607.jpg',
    price: 25,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Cookies 1Pkt',
    imageUrl: 'https://m.media-amazon.com/images/I/81EgwRfgLiL._AC_UF1000,1000_QL80_.jpg',
    price: 99,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Haldiram  1Kg',
    imageUrl: 'https://m.media-amazon.com/images/I/81khBWglt5L.jpg',
    price: 140,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Coconut Oil 250ml',
    imageUrl: 'https://www.bigbasket.com/media/uploads/p/l/40033680-2_5-parachute-advansed-aloe-vera-enriched-coconut-hair-oil.jpg',
    price: 120,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Cashew  250gm.',
    imageUrl: 'https://m.media-amazon.com/images/I/812eMu9Ca1L._AC_UF1000,1000_QL80_.jpg',
    price: 220,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Dettol  (125gm*4)',
    imageUrl: 'https://m.media-amazon.com/images/I/61LN2W9ShzL.jpg',
    price: 310,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'SurfExcel  1Kg',
    imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2021/8/JZ/HC/FZ/27715606/surf-excel-easy-wash-1kg.jpg',
    price: 250,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Basmati Rice  1Kg',
    imageUrl: 'https://5.imimg.com/data5/SELLER/Default/2022/11/WN/RU/DG/82381919/bopp-basmati-rice-packaging-bag.jpg',
    price: 125,
    category: 'grocery', // Added category
  ),
  Product(
    name: 'Facewash  100ml',
    imageUrl: 'https://assets.ajio.com/medias/sys_master/root/20230317/8sUg/6414a958f997dde6f4077a9b/-473Wx593H-4904029960-multi-MODEL.jpg',
    price: 170,
    category: 'grocery', // Added category
  ),
];