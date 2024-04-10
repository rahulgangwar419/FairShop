part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

abstract class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final Product clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final CartProduct clickedProduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
