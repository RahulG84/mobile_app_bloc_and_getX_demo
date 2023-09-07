import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/data/wishlist_items.dart';
import 'package:bloc_demo/features/home/models/home_products_models.dart';
import 'package:bloc_demo/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCart>(cartRemoveFromCart);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(
      CartScuessState(cartItems: cartItems),
    );
  }

  FutureOr<void> cartRemoveFromCart(
      CartRemoveFromCart event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(
      CartScuessState(cartItems: cartItems),
    );
    emit(CartRemoveActionSate());
  }
}
