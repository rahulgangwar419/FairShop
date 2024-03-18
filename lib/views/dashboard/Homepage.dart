import 'package:firstprogram/views/authorization/login.dart';
import 'package:firstprogram/views/dashboard/Imagespage.dart';
import 'package:firstprogram/views/dashboard/add_to_cart.dart';

import 'package:firstprogram/views/dashboard/description_text.dart';
import 'package:firstprogram/views/dashboard/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int myIndex = 0;

  var imagePathList = [
    'assets/images/pic1.jpg',
    'assets/images/pic2.png',
    'assets/images/pic3.png',
    'assets/images/play_store_512.png',
    'assets/images/rahul.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child:widgetList[myIndex]
      // ),

      /*  This code is for Drawer Part  */

      drawer: Drawer(
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
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
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
                                              builder: (context) =>
                                                  LoginPage()));
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
      ),
      /* This is Home Screen Icons Code */

      bottomNavigationBar: BottomNavigationBar(
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
                icon: Icon(Icons.category), label: 'Category'),
                BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_rounded), label: 'My Cart'),
          ]),

      /* Add Images on Home Page */
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  splashRadius: 40,
                  icon: Image.asset(
                    'assets/images/pic2.png',
                    height: 40,
                    width: 40,
                  )),
              const SizedBox(
                width: 8,
              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDSAe4EPdDMfQPS7rFx7sXFvysUPgOZPg1K6boFMeitg&s',
                height: 40,
                width: MediaQuery.of(context).size.width / 3.2,
              ),
           
              const SizedBox(
                width: 8,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications_rounded)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_bag_rounded))
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 400,
            child: GridView.builder(
              itemCount: 11,
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(8.0),
                  // margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              products[index].imageUrl,
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Column(
                          children: [
                            Text(
                              products[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rs.${products[index].price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddToCartPage(products: products,)));
                                    },
                                    icon: const Icon(Icons.add_shopping_cart))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            ),
          ),
        ),
      ]),
    );
  }
}
