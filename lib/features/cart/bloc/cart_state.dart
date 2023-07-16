part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartLoadedSuccesState extends CartState {
  final List<ProductModel> cartItems;

  CartLoadedSuccesState(this.cartItems);
}
