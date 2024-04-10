import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firstprogram/data/cart_items.dart';
import 'package:firstprogram/data/product_list.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartBlocInitialEvent>(cartBlocInitialEvent);
    on<CartItemRemoveFromCartEvent>(cartItemRemoveFromCartEvent);
  }

  FutureOr<void> cartBlocInitialEvent(
      CartBlocInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartItemRemoveFromCartActionState());
  }

  FutureOr<void> cartItemRemoveFromCartEvent(
      CartItemRemoveFromCartEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.cartProduct);
    emit(CartBlocInitial());
  }
}
