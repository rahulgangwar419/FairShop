import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Account Information'),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.teal,
                  elevation: 6,
                  behavior: SnackBarBehavior.floating,
                  content: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'This feature will be available soon.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Card(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Setting',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.language_outlined),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Select Language',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(Icons.arrow_right_outlined),
                        // SizedBox(
                        //   height: 20,
                        // ),
                      ]),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.notification_add_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ' Notification Setting',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.arrow_right_outlined),
                        // SizedBox(
                        //   height: 15,
                        // ),
                      ]),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.headset_mic_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '  Help Center',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Icon(Icons.arrow_right_outlined),
                      // SizedBox(
                      //   height: 6,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.teal,
                    elevation: 6,
                    behavior: SnackBarBehavior.floating,
                    content: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'This feature will be available soon.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Earn with Fair Shop',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.gif_box_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Sell on Fair Shop',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.arrow_right_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.teal,
                    elevation: 6,
                    behavior: SnackBarBehavior.floating,
                    content: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'This feature will be available soon.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feedback & Information',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.pages_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Terms and Policies',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Icon(Icons.arrow_right_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
