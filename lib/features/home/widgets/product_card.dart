import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_bloc/features/home/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required ProductModel product,
    required void Function(ProductModel productModel) wishlistButtonCallback,
    required void Function(ProductModel productModel) cartButtonCallback,
  })  : _product = product,
        _wishlistCallback = wishlistButtonCallback,
        _addToCartCallback = cartButtonCallback;

  final ProductModel _product;
  final void Function(ProductModel productModel) _wishlistCallback;
  final void Function(ProductModel productModel) _addToCartCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: _product.imageUrl,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(),
                    Text(_product.description),
                    const Gap(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _product.price.toStringAsFixed(2),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _wishlistCallback(_product);
                          },
                          icon: const Icon(Icons.favorite_border),
                        ),
                        IconButton(
                          onPressed: () {
                            _addToCartCallback(_product);
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gap extends StatelessWidget {
  const Gap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}
