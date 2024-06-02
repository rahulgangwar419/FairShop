import 'dart:developer';
import 'package:fairShop/data/cart_items.dart';
import 'package:fairShop/data/product_list.dart';
import 'package:fairShop/data/wishlist_items.dart';
import 'package:fairShop/features/home/ui/bloc/home_bloc.dart';
import 'package:fairShop/features/wishlist/ui/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    // log("Item : $wishlistItems");
    return MultiBlocListener(
        listeners: [
          BlocListener<WishlistBloc, WishlistState>(
            bloc: wishlistBloc,
            listenWhen: (previous, current) => current is WishlistActionState,
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
          ),
          BlocListener<HomeBloc, HomeState>(
            bloc: homeBloc,
            listener: (context, state) {
              if (state is HomeProductItemCartedActionState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: const Text(
                      "Cart added.",
                      style: TextStyle(color: Colors.white),
                    )));
              }
            },
          ),
        ],
        child: BlocBuilder<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.teal,
                title: const Text(
                  'Wishlist',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: wishlistItems.isEmpty
                  ? SizedBox(
                      child: Center(
                        child: Image.network(
                          'https://www.shopperswarehouse.com/assets/e_website/assets/site_image/empty_wishlist.png',
                          height: MediaQuery.of(context).size.height / 3.2,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) {
                        return _buildItemCard(wishlistItems[index], index);
                      },
                    ),
            );
          },
        ));
  }

  Widget _buildItemCard(Product item, index) {
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
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
                            color: Colors.black, fontWeight: FontWeight.bold),
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
                          onTap: () {
                            homeBloc.add(HomeProductCartButtonClickedEvent(
                                clickedProduct: CartProduct(
                                    name: item.name,
                                    imageUrl: item.imageUrl,
                                    price: item.price,
                                    quantitiy: 1)));
                            wishlistBloc.add(
                                WishListItemRemoveEvent(wishListedItem: item));
                          },
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
