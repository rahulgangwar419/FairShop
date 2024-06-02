import 'package:fairShop/data/cart_items.dart';
import 'package:fairShop/features/home/ui/account_details.dart';
import 'package:fairShop/features/home/ui/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fairShop/data/product_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({super.key, required this.product});
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.green,
                content: const Text(
                  "Cart added.",
                  style: TextStyle(color: Colors.white),
                )));
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: product.imageUrl,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Rs.${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      SizedBox(height: 16),
                      Text(
                        product.description!,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),

                      // We temporary added this Icon Button just for page Checking
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeBloc.add(HomeProductCartButtonClickedEvent(
              clickedProduct: CartProduct(
                  name: product.name,
                  imageUrl: product.imageUrl,
                  price: product.price,
                  quantitiy: 1)));
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
