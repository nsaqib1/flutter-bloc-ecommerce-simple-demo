import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_bloc/features/cart/pages/cart_page.dart';
import 'package:flutter_ecommerce_bloc/features/home/bloc/home_bloc.dart';
import 'package:flutter_ecommerce_bloc/features/home/models/product_model.dart';
import 'package:flutter_ecommerce_bloc/features/home/widgets/product_card.dart';
import 'package:flutter_ecommerce_bloc/features/wishlist/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final homeBloc = HomeBloc();
  void addToCartCallback(ProductModel productModel) {
    homeBloc.add(HomeProdictCartButtonClickEvent(productModel));
  }

  void wishlistCallback(ProductModel productModel) {
    homeBloc.add(HomeProductWishlistButtonClickEvent(productModel));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current is! HomeActionState;
      },
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishlistPage(),
            ),
          );
        }
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        }
        if (state is HomeProductAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to Cart'),
            ),
          );
        }
        if (state is HomeProductAddedToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added To Wishlist'),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );

          case HomeLoadedSuccessState:
            final products = (state as HomeLoadedSuccessState).product;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Ecommerce Bloc'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_outline_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    cartButtonCallback: addToCartCallback,
                    wishlistButtonCallback: wishlistCallback,
                  );
                },
              ),
            );

          case HomeLoadedErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
