
import 'package:firstprogram/views/authorization/login.dart';
import 'package:firstprogram/views/dashboard/Imagespage.dart';
import 'package:firstprogram/views/dashboard/descriptionpage.dart';
import 'package:firstprogram/views/dashboard/description_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int myIndex = 0;

  List<String> vegeTables = [
    'assets/vegetables/aadu.jpg',
    'assets/vegetables/acharimirch.jpg',
    'assets/vegetables/anaar.jpg',
    'assets/vegetables/apple.jpg',
    'assets/vegetables/banana.jpg',
    'assets/vegetables/bandgobhi.jpg',
    'assets/vegetables/cabbage.jpg',
    'assets/vegetables/cake.jpg',
    'assets/vegetables/caroot.jpg',
    'assets/vegetables/Cauliflower.jpg',
    'assets/vegetables/grapes.jpg',
    'assets/vegetables/kalaangoor.jpg',
    'assets/vegetables/ladyfinger.jpg',
    'assets/vegetables/litchi.jpg',
    'assets/vegetables/mango.jpg',
    'assets/vegetables/matar.jpg',
    'assets/vegetables/orange.jpg',
    'assets/vegetables/palak.jpg',
    'assets/vegetables/papaya.jpg',
    'assets/vegetables/pumpkin.jpg',
    'assets/vegetables/redchilli.jpg',
    'assets/vegetables/sahtoot.jpg',
    'assets/vegetables/tomato.jpg',
    'assets/vegetables/strawberry.jpg',
    'assets/vegetables/watermelon.jpg',
  ];

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
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: Colors.blue,
          ),
        )),
      ),

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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      LoginPage();
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             HomePage()));
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                // const SizedBox(width: 75,),
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
                icon: Icon(Icons.notifications), label: 'Notification'),
          ]),

      /* Add Images on Home Page */
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 100,
              width: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DescriptionPage(vegetables: vegeTables[index],description:description[index])));
                },
                child: Image.asset(
                  vegeTables[index],
                  fit: BoxFit.fill,
                ),
              ));
        },
      ),
    );
  }
}
