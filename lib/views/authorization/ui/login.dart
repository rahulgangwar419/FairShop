import 'package:firstprogram/controllers/auth_controller.dart';
import 'package:firstprogram/views/authorization/ui/signupPage.dart';
import 'package:firstprogram/views/dashboard/ui/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstprogram/features/home/ui/Homepage.dart';
import 'package:firstprogram/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter e-mail';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please Enter a vaild e-mail';
    } else {
      return null;
    }
  }

  String? _validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter password';
    }
    if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$')
        .hasMatch(value)) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Fair Shop',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.lightBlue,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  labelText: "Email Address",
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validUserName,
                  onSaved: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  // controller: loginPassword,
                  labelText: "Password",
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  keyboardType: TextInputType.visiblePassword,
                  validator: _validPassword,
                  onSaved: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor:
                            const Color.fromARGB(255, 212, 133, 160)),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Color.fromARGB(255, 197, 18, 108),
                      ),
                    ),
                    onPressed: () async {
                      //await fetchData();
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'If you are new User ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 88, 83, 83), fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Signup())));
                        },
                        child: Text('SignUp'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
