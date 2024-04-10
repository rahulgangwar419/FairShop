import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage(String vegeTabl, {super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Notifcation Page',
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
