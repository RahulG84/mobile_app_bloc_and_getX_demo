part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCart extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveFromCart({required this.productDataModel});
}
