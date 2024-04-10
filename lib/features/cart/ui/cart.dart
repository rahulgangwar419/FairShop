import 'dart:ffi';

import 'package:firstprogram/data/cart_items.dart';
import 'package:firstprogram/features/cart/ui/bloc/cart_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBlocBloc = CartBlocBloc();
  double itemTotalPrice = 0.0;
  int qty = 0;
  int itemCount = 0;
  double allItemAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBlocBloc, CartBlocState>(
      bloc: CartBlocBloc(),
      listenWhen: (previous, current) => current is CartBlocActionState,
      buildWhen: (previous, current) => current is! CartBlocActionState,
      listener: (context, state) {
        if (state is CartItemRemoveFromCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item Remove From Cart")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: cartItems.isEmpty
              ? SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No Item Found..!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.network(
                            'https://cdni.iconscout.com/illustration/premium/thumb/empty-cart-2130356-1800917.png?f=webp')
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 80,
                                    child: Image.network(
                                        cartItems[index].imageUrl),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        cartItems[index].name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Rs.${cartItems[index].price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            if (cartItems[index].quantitiy <=
                                                1) {
                                              return;
                                            }
                                            int quantityItem =
                                                cartItems[index].quantitiy - 1;
                                            cartItems[index] = CartProduct(
                                                name: cartItems[index].name,
                                                imageUrl:
                                                    cartItems[index].imageUrl,
                                                price: cartItems[index].price,
                                                quantitiy: quantityItem);
                                            itemTotalPrice = itemTotalPrice -
                                                cartItems[index].price;
                                            setState(() {});
                                          },
                                          child:
                                              const Icon(Icons.remove_circle)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("${cartItems[index].quantitiy}"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            int quantityItem =
                                                cartItems[index].quantitiy + 1;
                                            cartItems[index] = CartProduct(
                                                name: cartItems[index].name,
                                                imageUrl:
                                                    cartItems[index].imageUrl,
                                                price: cartItems[index].price,
                                                quantitiy: quantityItem);
                                            itemTotalPrice = itemTotalPrice +
                                                cartItems[index].price;
                                            setState(() {});
                                          },
                                          child: const Icon(Icons.add_circle))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.delete_forever_sharp,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      height: 200,
                      decoration: BoxDecoration(color: Colors.teal.shade100),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Items Total Amount',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                itemTotalPrice.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),

                          const Divider(
                            thickness: 0.2,
                            color: Colors.grey,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping Amount',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '20',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),

                          const Divider(
                            thickness: 0.2,
                            color: Colors.grey,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amout',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '3020',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),

                          const Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                          // TextButton(
                          //   child: Text(
                          //     'Payment Now',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         backgroundColor: Colors.lightBlue),
                          //   ),
                          //   onPressed: () {},
                          // )

                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: CupertinoButton(
                                    color: Colors.blue,
                                    child: Text('Pay Now',
                                        style: TextStyle(fontSize: 20)),
                                    onPressed: () {},
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
