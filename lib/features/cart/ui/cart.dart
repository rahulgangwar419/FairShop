import 'dart:developer';
import 'package:fairShop/data/cart_items.dart';
import 'package:fairShop/features/cart/ui/bloc/cart_bloc_bloc.dart';
import 'package:fairShop/payment/payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../payment/payment.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBlocBloc = CartBlocBloc();
  double itemTotalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    // Calculate initial total price based on current cart items
    itemTotalPrice = cartItems.fold(
        0, (total, current) => total + current.price * current.quantitiy);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBlocBloc, CartBlocState>(
      bloc: cartBlocBloc,
      listenWhen: (previous, current) => current is CartBlocActionState,
      buildWhen: (previous, current) => current is! CartBlocActionState,
      listener: (context, state) {
        if (state is CartItemRemoveFromCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Item Removed From Cart",
                style: TextStyle(color: Colors.white),
              )));
        } else if (state is CartItemAddQuantityState) {
          setState(() {
            itemTotalPrice += state.itemPrice;
          });
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
                                            setState(() {
                                              if (cartItems[index].quantitiy >
                                                  0) {
                                                int quantityItem =
                                                    cartItems[index].quantitiy -
                                                        1;
                                                itemTotalPrice -=
                                                    cartItems[index].price;
                                                cartItems[index] = CartProduct(
                                                    name: cartItems[index].name,
                                                    imageUrl: cartItems[index]
                                                        .imageUrl,
                                                    price:
                                                        cartItems[index].price,
                                                    quantitiy: quantityItem);
                                              }
                                            });
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
                                            setState(() {
                                              int quantityItem =
                                                  cartItems[index].quantitiy +
                                                      1;
                                              itemTotalPrice +=
                                                  cartItems[index].price;
                                              cartItems[index] = CartProduct(
                                                  name: cartItems[index].name,
                                                  imageUrl:
                                                      cartItems[index].imageUrl,
                                                  price: cartItems[index].price,
                                                  quantitiy: quantityItem);
                                            });
                                          },
                                          child: const Icon(Icons.add_circle))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        itemTotalPrice -=
                                            cartItems[index].price *
                                                cartItems[index].quantitiy;
                                        cartItems.removeAt(index);
                                      });
                                      cartBlocBloc.add(
                                          CartItemRemoveFromCartEvent(
                                              cartProduct: cartItems[index]));
                                    },
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
                                'Items Amount',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                itemTotalPrice.toStringAsFixed(2),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Amount',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                (itemTotalPrice + 20).toStringAsFixed(
                                    2), // Adding shipping amount
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: CupertinoButton(
                                    color: Colors.blue,
                                    child: const Text('Pay Now',
                                        style: TextStyle(fontSize: 20)),
                                    onPressed: () {
                                      makePayment((itemTotalPrice + 20).ceil().toString());
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => PaymentPage(
                                      //             amount:
                                      //                 itemTotalPrice + 20)));
                                    },
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
