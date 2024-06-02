import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairShop/data/cart_items.dart';
import 'package:fairShop/data/product_list.dart';
import 'package:fairShop/data/wishlist_items.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    bool alreadyExists =
        wishlistItems.any((item) => item.name == event.clickedProduct.name);
    // If the item does not exist, add it to the cartItems list
    if (!alreadyExists) {
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductItemWishlistedActionState());
    } else {
      emit(HomeProductWhistlistAlreadyExistActionState());
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
         bool alreadyExists =
        cartItems.any((item) => item.name == event.clickedProduct.name);
         if (!alreadyExists){
             cartItems.add(event.clickedProduct);
             emit(HomeProductItemCartedActionState());
         }
         else{
          emit(HomeProductCartAlreadyExistActionState());
         }
         }
    
   
    
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }

