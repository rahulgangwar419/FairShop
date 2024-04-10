import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firstprogram/data/cart_items.dart';
import 'package:firstprogram/data/product_list.dart';
import 'package:firstprogram/data/wishlist_items.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<WishlistInitial>(wishlistInitial);
    on<WishListItemRemoveEvent>(wishListItemRemoveEvent);
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
}
