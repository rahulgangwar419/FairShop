import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentPage extends StatefulWidget {
  final double amount;

  const PaymentPage({Key? key, required this.amount}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            const Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: _selectedPaymentMethod == 0 ? Colors.blue : Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/191/51/png-transparent-google-pay-or-tez-hd-logo-thumbnail.png'),
                  ),
                  title: const Text('Google Pay'),
                  trailing: Radio(
                    value: 0,
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value as int;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 1;
                });
              },
              
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: _selectedPaymentMethod == 1 ? Colors.blue : Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage('https://www.iconpacks.net/icons/free-icons-6/free-amazon-pay-circle-round-logo-icon-19775-thumb.png'),
                  ),
                  title: const Text('Amazon Pay'),
                  trailing: Radio(
                    value: 1,
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value as int;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 2;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: _selectedPaymentMethod == 2 ? Colors.blue : Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage('https://e7.pngegg.com/pngimages/332/615/png-clipart-phonepe-india-unified-payments-interface-india-purple-violet.png'),
                  ),
                  title: const Text('PhonePe'),
                  trailing: Radio(
                    value: 2,
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value as int;
                      });
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(height: 180,),
            
            Expanded(
              child: Stack(
              
                children: [
                   Positioned(
                    bottom: 0,
                    left: 1,
                    right: 1,
                     child: Container(
                      
                         padding: const EdgeInsets.all(10),
                         width: double.infinity,
                         child: CupertinoButton(
                           color: Colors.blue,
                           child: Text('Pay Now Rs. ${widget.amount.toStringAsFixed(2)}',
                               style: TextStyle(fontSize: 20)),
                           onPressed: () {
                            
                           },
                         )),
                   ),
                ],
                         
              ),
            ),
            // Repeat the pattern for other payment methods
          ],
        ),
      ),
    );
  }
}


