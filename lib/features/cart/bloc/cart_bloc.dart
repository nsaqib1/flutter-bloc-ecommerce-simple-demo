import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_bloc/data/products_data.dart';
import 'package:flutter_ecommerce_bloc/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(
      (event, emit) {
        emit(CartLoadedSuccesState(ProductsData.cartItems));
      },
    );

    on<CartRemoveFromCartEvent>(
      (event, emit) {
        ProductsData.cartItems.removeWhere(
          (element) => element.id == event.cartId,
        );
        emit(CartLoadedSuccesState(ProductsData.cartItems));
      },
    );
  }
}
