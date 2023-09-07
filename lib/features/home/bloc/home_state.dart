part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeCounterState extends HomeState {
  int counter;
  HomeCounterState({required this.counter});
}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadingSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
