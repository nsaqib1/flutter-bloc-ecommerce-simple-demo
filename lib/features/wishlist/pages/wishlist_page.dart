import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_bloc/features/wishlist/bloc/wishlist_bloc.dart';

import '../../home/models/product_model.dart';
import '../../home/widgets/product_card.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final wishlistBlock = WishlistBloc();
  void cartButtonCallback(ProductModel productModel) {
    // wishlistBlock.add(CartRemoveFromCartEvent(productModel.id));
  }

  void wishlistButtonCallback(ProductModel productModel) {
    wishlistBlock.add(WishlistRemoveFromWishlistEvent(productModel));
  }

  @override
  void initState() {
    wishlistBlock.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
      ),
      body: BlocConsumer(
        bloc: wishlistBlock,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistLoadedSuccessState:
              final products =
                  (state as WishlistLoadedSuccessState).wishlistItems;
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    cartButtonCallback: cartButtonCallback,
                    wishlistButtonCallback: wishlistButtonCallback,
                  );
                },
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
