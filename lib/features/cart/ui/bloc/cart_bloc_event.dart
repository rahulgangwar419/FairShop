part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocEvent {}

abstract class CartBlocActionEvent extends CartBlocEvent {}

class CartBlocInitialEvent extends CartBlocEvent {}

class CartItemRemoveFromCartEvent extends CartBlocActionEvent {
  final CartProduct cartProduct;

  CartItemRemoveFromCartEvent({required this.cartProduct});
}

class CartItemAddQuantityEvent extends CartBlocEvent {
  final int index;

  CartItemAddQuantityEvent({required this.index});                                                                       
}

class CartItemRemoveQuantityEvent extends CartBlocActionEvent {
  final CartProduct cartProduct;

  CartItemRemoveQuantityEvent({required this.cartProduct});
}
