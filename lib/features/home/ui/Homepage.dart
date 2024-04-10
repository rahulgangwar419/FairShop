import 'dart:developer';
import 'package:firstprogram/data/cart_items.dart';
import 'package:firstprogram/features/home/ui/bloc/home_bloc.dart';
import 'package:firstprogram/features/wishlist/ui/wishlist_page.dart';
import 'package:firstprogram/views/authorization/ui/login.dart';
import 'package:firstprogram/data/Imagespage.dart';
import 'package:firstprogram/features/cart/ui/cart.dart';
import 'package:firstprogram/data/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int myIndex = 0;
  final HomeBloc homeBloc = HomeBloc();

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 10,
      width: 220,
      shadowColor: Colors.red,
      child: ListView(
        children: [
          Container(
            height: 150,
            color: const Color.fromARGB(255, 228, 213, 182),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 8,
                  shadowColor: Colors.red,
                  child: Image.asset(
                    'assets/images/pic2.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Rahul Gangwar',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'B.Tech.',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ])),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add_card,
                color: Colors.black,
              ),
              label: const Text(
                'Add to Card',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add_card,
                color: Colors.black,
              ),
              label: const Text(
                'Add product',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DashBoard()));
              },
              child: const Text(
                'Gallery',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 390,
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          TextButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(
                            child: Text(
                          'Do you want to Logout',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    LoginPage();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.logout,
                size: 25,
                color: Colors.black,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
            debugPrint('$index');
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Wish List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_rounded), label: 'My Cart'),
        ]);
  }

  buildAppBar() {
    return AppBar(
      title: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDSAe4EPdDMfQPS7rFx7sXFvysUPgOZPg1K6boFMeitg&s',
          height: 40,
          width: MediaQuery.of(context).size.width / 3.2),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              homeBloc.add(HomeWishlistButtonNavigateEvent());
            },
            icon: const Icon(Icons.favorite_border_rounded)),
        IconButton(
            onPressed: () {
              homeBloc.add(HomeCartButtonNavigateEvent());
            },
            icon: const Icon(Icons.shopping_bag_rounded))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      bottomNavigationBar: buildBottomNavigationBar(),
      appBar: buildAppBar(),
      body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          buildWhen: (previous, current) => current is! HomeActionState,
          listenWhen: (previous, current) => current is HomeActionState,
          listener: (context, state) {
            if (state is HomeNavigateToCartPageActionState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            } else if (state is HomeNavigateToWishlistPageActionState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistPage()));
            } else if (state is HomeProductItemCartedActionState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Item Carted')));
            } else if (state is HomeProductItemWishlistedActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item Wishlisted')));
            } else if (state is HomeProductWhistlistAlreadyExistActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Item Wishlisted Alreay Exist.')));
            } else if (state is HomeProductCartAlreadyExistActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item alrady in Cart.')));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icon/fruitslogo.png',
                            height: 20,
                            width: 50,
                          ),
                          label: const Text(
                            'FRUITS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton.icon(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icon/vegicon.png',
                            height: 20,
                            width: 50,
                          ),
                          label: const Text(
                            'VEGETABLES',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton.icon(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icon/grocery.png',
                            height: 20,
                            width: 50,
                          ),
                          label: const Text(
                            'GROCERY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Column(
                            children: [
                              SizedBox(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.network(
                                  products[index].imageUrl,
                                  height: 100,
                                  fit: BoxFit.fitWidth,
                                ),
                              )),
                              const SizedBox(width: 4),
                              Text(products[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rs.${products[index].price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        homeBloc.add(
                                            HomeProductWishlistButtonClickedEvent(
                                                clickedProduct: Product(
                                          name: products[index].name,
                                          imageUrl: products[index].imageUrl,
                                          price: products[index].price,
                                        )));
                                      },
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.red,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        homeBloc.add(
                                            HomeProductCartButtonClickedEvent(
                                                clickedProduct: CartProduct(
                                                    name: products[index].name,
                                                    imageUrl: products[index]
                                                        .imageUrl,
                                                    price:
                                                        products[index].price,
                                                    quantitiy: 1)));
                                      },
                                      child: const Icon(
                                        Icons.add_shopping_cart_rounded,
                                        color: Color.fromARGB(255, 18, 160, 91),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}
