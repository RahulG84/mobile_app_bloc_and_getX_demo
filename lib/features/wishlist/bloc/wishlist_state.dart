part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSucessState extends WishlistState {
  final List<ProductDataModel> wishlistItem;

  WishlistSucessState({required this.wishlistItem});
}

class WishlistRemoveActionState extends WishlistActionState{}