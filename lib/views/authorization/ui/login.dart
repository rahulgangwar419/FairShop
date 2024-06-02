import 'package:fairShop/features/home/ui/Homepage.dart';
import 'package:fairShop/views/authorization/ui/signupPage.dart';
import 'package:fairShop/views/dashboard/ui/splash_page.dart';
import 'package:fairShop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    } else if (!value.endsWith('@gmail.com')) {
      return 'Only Gmail accounts are allowed';
    } else {
      return null;
    }
  }

  String? _validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value != '00000000') {
      return 'Incorrect password';
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: const Text(
          'Fair Shop',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to Fair Shop",
                  style: TextStyle(color: Colors.grey, fontSize: 24),
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: "Email Address",
                        hintText: "Enter your email",
                        keyboardType: TextInputType.emailAddress,
                        validator: _validUserName,
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: "Password",
                        hintText: "Enter your password",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: _validPassword,
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () async {
                          if (password != "00000000") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.teal,
                                elevation: 6,
                                behavior: SnackBarBehavior.floating,
                                content: Row(
                                  children: [
                                    Icon(Icons.info_outline,
                                        color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      'Default password is 00000000',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }

                          var sharedPref =
                              await SharedPreferences.getInstance();
                          sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                        child: Text('LOGIN'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text('New User? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
