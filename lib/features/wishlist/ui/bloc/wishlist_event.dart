part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitial extends WishlistEvent{
  
}


class WishListItemRemoveEvent extends WishlistEvent {
  final Product wishListedItem;

  WishListItemRemoveEvent({required this.wishListedItem});
}

class WishListItemAddToCartEvent extends WishlistEvent {
  final Product wishListedItem;

  WishListItemAddToCartEvent({required this.wishListedItem});
}

class WishListItemNotFoundEvent extends WishlistEvent{}
