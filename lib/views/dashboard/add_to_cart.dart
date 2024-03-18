import 'package:firstprogram/views/dashboard/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class AddToCartPage extends StatefulWidget {
//   final List products;

//   const AddToCartPage({super.key, required this.products});

//   @override
//   State<AddToCartPage> createState() => _AddToCartPageState();

// }

// class _AddToCartPageState extends State<AddToCartPage> {
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.shopping_bag),
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.asset(products[index].imageUrl),
//             title: Text(
//               products[index].name,
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             // subtitle: Text({products[index].price} as String),
//           );
//         },
//       ),
//     );
// }
// }
class AddToCartPage extends StatefulWidget {
  final List products;

  const AddToCartPage({Key? key, required this.products}) : super(key: key);

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_bag),
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(widget.products[index].imageUrl),
            title: Text(
              widget.products[index].name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            // subtitle: Text(widget.products[index].price.toString()), // Assuming price is a double or int
          );
        },
      ),
    );
  }
}










// import 'package:firstprogram/views/dashboard/description_text.dart';
// import 'package:flutter/material.dart';

// class DescriptionPage extends StatelessWidget {
//   final String vegetables;
//   final String description;
//   const DescriptionPage({
//     super.key,
//     required this.vegetables,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.lightBlue,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 vegetables,
//                 height: MediaQuery.of(context).size.height / 2.2,
//                 width: MediaQuery.of(context).size.width - 48,
//               ),
//               const SizedBox(height: 8.0),
//               Text(description)
//             ],
//           ),
//         ));
//   }
// }
