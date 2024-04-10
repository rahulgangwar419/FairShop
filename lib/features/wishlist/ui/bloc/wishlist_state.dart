part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}
class WishlistActionState extends WishlistState{}


 class WishlistInitialState extends WishlistState {}

 class WishListLoadedState extends WishlistActionState{
  

  final Product cartList;

  WishListLoadedState({required this.cartList});

  
}
 

class WishListItemRemoveState extends WishlistActionState{}

class WishListItemAddToCarState extends WishlistActionState{}


