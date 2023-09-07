part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartRemoveActionSate extends CartActionState{}

class CartScuessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartScuessState({required this.cartItems});
}
