import 'package:firstprogram/views/authorization/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          
          title:const Center(
              child: Text(
            'SignUp',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          )),
          backgroundColor:const Color.fromARGB(255, 96, 211, 240),
        ),
        body: Center(
          child: Padding(
            padding:const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      label: Text('Email Address'),
                      hintText: 'Enter Email address',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
                const SizedBox(
                  height: 30,
                ),
               const TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      label: Text(' Password'),
                      hintText: 'Create Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
               const SizedBox(
                  height: 30,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(100, 30)),
                    onPressed: () {

                       final snackBar = SnackBar(
                        backgroundColor: Colors.lightBlue.shade50,
                        
                content: const Text('SignUp Successfully...!',style: TextStyle(color: Colors.black),),
                duration: const Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                    child: const Text('SignUp'))
              ],
            ),
          ),
        ));
  }
}
