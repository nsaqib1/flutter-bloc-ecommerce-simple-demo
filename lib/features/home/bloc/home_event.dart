part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final ProductModel productModel;

  HomeProductWishlistButtonClickEvent(this.productModel);
}

class HomeProdictCartButtonClickEvent extends HomeEvent {
  final ProductModel productModel;

  HomeProdictCartButtonClickEvent(this.productModel);
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
