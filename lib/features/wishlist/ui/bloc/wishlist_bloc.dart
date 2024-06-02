import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fairShop/data/product_list.dart';
import 'package:fairShop/data/wishlist_items.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<WishlistInitial>(wishlistInitial);
    on<WishListItemRemoveEvent>(wishListItemRemoveEvent);
    on<WishListItemAddToCartEvent>(wishListItemAddToCartEvent);
  }

  FutureOr<void> wishlistInitial(
      WishlistInitial event, Emitter<WishlistState> emit) {
    emit(WishlistInitialState());
  }

  FutureOr<void> wishListItemRemoveEvent(
      WishListItemRemoveEvent event, Emitter<WishlistState> emit) {
    print('Item Remove');
    wishlistItems.remove(event.wishListedItem);
    emit(WishlistInitialState());
  }

  FutureOr<void> wishListItemAddToCartEvent(
      WishListItemAddToCartEvent event, Emitter<WishlistState> emit) {
    print('item moved to Cart');
    wishlistItems.add(event.wishListedItem);
  }
}
