import 'package:firstprogram/views/dashboard/description_text.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String vegetables;
  final String description;
  const DescriptionPage({
    super.key,
    required this.vegetables,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                vegetables,
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width - 48,
              ),
              const SizedBox(height: 8.0),
              Text(description)
            ],
          ),
        ));
  }
}
