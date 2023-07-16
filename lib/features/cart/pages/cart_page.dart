import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecommerce_bloc/features/home/models/product_model.dart';

import '../../home/widgets/product_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  void cartButtonCallback(ProductModel productModel) {
    cartBloc.add(CartRemoveFromCartEvent(productModel.id));
  }

  void wishlistButtonCallback(ProductModel productModel) {}
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: BlocConsumer(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadedSuccesState:
              final products = (state as CartLoadedSuccesState).cartItems;

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
          }
          return Container();
        },
      ),
    );
  }
}
