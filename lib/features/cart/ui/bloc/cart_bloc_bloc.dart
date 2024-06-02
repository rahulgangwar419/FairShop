import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:fairShop/data/cart_items.dart';
import 'package:meta/meta.dart';

import '../../../../data/cart_items.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartBlocInitialEvent>(cartBlocInitialEvent);
    on<CartItemRemoveFromCartEvent>(cartItemRemoveFromCartEvent);
    // on<CartItemAddQuantityEvent>(cartItemAddQuantityEvent);
  }

  FutureOr<void> cartBlocInitialEvent(
      CartBlocInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartBlocInitial());
  }

  FutureOr<void> cartItemRemoveFromCartEvent(
      CartItemRemoveFromCartEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.cartProduct);
    log('message');
    emit(CartBlocInitial());
  }

  // FutureOr<void> cartItemAddQuantityEvent(
  //     CartItemAddQuantityEvent event, Emitter<CartBlocState> emit) {
  //   int quantityItem = cartItems[event.index].quantitiy + 1;
  //   cartItems[event.index] = CartProduct(
  //     name: cartItems[event.index].name,
  //     imageUrl: cartItems[event.index].imageUrl,
  //     price: cartItems[event.index].price,
  //     quantitiy: quantityItem,
  //   );
  //   log("Hitted");
  //   emit(CartItemAddQuantityState(cartItems[event.index].price));
   
  // }
}
