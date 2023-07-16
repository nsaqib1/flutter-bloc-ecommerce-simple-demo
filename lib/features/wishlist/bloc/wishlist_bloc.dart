import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_bloc/data/products_data.dart';
import 'package:flutter_ecommerce_bloc/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(
      (event, emit) {
        emit(WishlistLoadedSuccessState(ProductsData.wishlistItems));
      },
    );

    on<WishlistRemoveFromWishlistEvent>(
      (event, emit) {
        ProductsData.wishlistItems.remove(event.productModel);
        emit(WishlistLoadedSuccessState(ProductsData.wishlistItems));
      },
    );
  }
}
