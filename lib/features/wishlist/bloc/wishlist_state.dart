part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState {}

class WishlistInitial extends WishlistState {}

class WishlistLoadedSuccessState extends WishlistState {
  final List<ProductModel> wishlistItems;

  WishlistLoadedSuccessState(this.wishlistItems);
}
