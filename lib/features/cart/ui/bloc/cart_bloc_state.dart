part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

class CartBlocActionState extends CartBlocState {}

class CartBlocInitial extends CartBlocState {}

class CartItemRemoveFromCartActionState extends CartBlocActionState {}

class CartItemAddQuantityState extends CartBlocActionState {
  final double itemPrice;
  CartItemAddQuantityState(this.itemPrice);
}

class CartItemRemoveQuantityState extends CartBlocActionState {}
