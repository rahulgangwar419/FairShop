part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocEvent {}

abstract class  CartBlocActionEvent extends CartBlocEvent{}

class CartBlocInitialEvent extends CartBlocEvent{}

class CartItemRemoveFromCartEvent extends CartBlocActionEvent {
  final Product cartProduct;

  CartItemRemoveFromCartEvent({required this.cartProduct});
}

class CartItemAddQuantityEvent extends CartBlocActionEvent{}

class CartItemRemoveQuantityEvent extends CartBlocActionEvent{}