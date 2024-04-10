import 'dart:developer';

import 'package:firstprogram/data/product_list.dart';
import 'package:firstprogram/data/wishlist_items.dart';
import 'package:firstprogram/features/wishlist/ui/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    // log("Item : $wishlistItems");
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: WishlistBloc(),
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        log("state is : ${state.runtimeType}");
        if (state is WishListItemRemoveState) {
          
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.grey.shade200,
              content: const Text(
                'WishListed Item Remove..!!',
                style: TextStyle(color: Colors.red),
              )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.teal,
            title: const Text('Wishlist',style: TextStyle(color: Colors.white),),
          ),
          body: wishlistItems.isEmpty
              ? const SizedBox(
                  child: Center(
                    child: Text(
                      "No Item found!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    return _buildItemCard(wishlistItems[index]);
                  },
                ),
        );
      },
    );
  }

  Widget _buildItemCard(Product item) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs.${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                          onTap: () {
                            wishlistBloc.add(
                                WishListItemRemoveEvent(wishListedItem: item));
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 243, 35, 20),
                          )),
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.shopping_bag,
                            color: Color.fromARGB(255, 13, 93, 158),
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
