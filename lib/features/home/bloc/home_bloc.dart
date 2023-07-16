import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_bloc/data/products_data.dart';
import 'package:meta/meta.dart';

import '../models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        await Future.delayed(const Duration(seconds: 4));
        emit(
          HomeLoadedSuccessState(
            product: ProductsData.demoProducts
                .map((e) => ProductModel.fromJson(e))
                .toList(),
          ),
        );
      },
    );
    on<HomeWishlistButtonNavigateEvent>(
      (event, emit) {
        emit(HomeNavigateToWishlistPageActionState());
      },
    );

    on<HomeCartButtonNavigateEvent>(
      (event, emit) {
        emit(HomeNavigateToCartPageActionState());
      },
    );

    on<HomeProductWishlistButtonClickEvent>(
      (event, emit) {
        ProductsData.wishlistItems.add(event.productModel);

        emit(HomeProductAddedToWishlistActionState());
      },
    );

    on<HomeProdictCartButtonClickEvent>(
      (event, emit) {
        ProductsData.cartItems.add(event.productModel);

        emit(HomeProductAddedToCartActionState());
      },
    );
  }
}
