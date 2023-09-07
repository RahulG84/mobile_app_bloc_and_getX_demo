import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/data/mobile_data.dart';
import 'package:bloc_demo/data/wishlist_items.dart';

import 'package:meta/meta.dart';

import '../models/home_products_models.dart';

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
    await Future.delayed(const Duration(milliseconds: 200));
    emit(
      HomeLoadingSuccessState(
        products: MobileData.mobileProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                brand: e['brand'],
                model: e['model'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistActionState());
    print("WishList Product Clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
    print("Cart Product Clicked");
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("WishList Navigate Clicked");
    emit(
      HomeNavigateToWishlistPageActionState(),
    );
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Clicked");
    emit(
      HomeNavigateToCartPageActionState(),
    );
  }
}
