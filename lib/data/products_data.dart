import 'package:flutter_ecommerce_bloc/features/home/models/product_model.dart';

class ProductsData {
  const ProductsData._();
  static final List<Map<String, dynamic>> demoProducts = [
    {
      'id': 1,
      'name': 'Blue T-Shirt',
      'description': 'This is a blue t-shirt made of soft cotton.',
      'price': 9.99,
      'image_url':
          'https://static-01.daraz.com.bd/p/f48d83681503a3dfca32802a8e9e952c.jpg',
    },
    {
      'id': 2,
      'name': 'Black Sneakers',
      'description': 'These black sneakers are lightweight and comfortable.',
      'price': 49.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxmUZvEvDZ6QdfnScLCbVra_YpvGVZZMDH3Q&usqp=CAU',
    },
    {
      'id': 3,
      'name': 'Leather Wallet',
      'description': 'A stylish leather wallet with multiple card slots.',
      'price': 24.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 4,
      'name': 'Digital Watch',
      'description': 'A sleek digital watch with various useful features.',
      'price': 39.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 5,
      'name': 'Wireless Earphones',
      'description': 'High-quality wireless earphones with noise cancellation.',
      'price': 79.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 6,
      'name': 'Sports Water Bottle',
      'description': 'A durable sports water bottle with a leak-proof lid.',
      'price': 12.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 7,
      'name': 'Canvas Backpack',
      'description': 'A spacious canvas backpack with multiple compartments.',
      'price': 29.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 8,
      'name': 'Smartphone Holder',
      'description': 'A versatile smartphone holder for hands-free use.',
      'price': 14.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 9,
      'name': 'Portable Charger',
      'description':
          'A compact portable charger with fast charging capability.',
      'price': 19.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
    {
      'id': 10,
      'name': 'Stainless Steel Watch',
      'description':
          'An elegant stainless steel watch for both casual and formal occasions.',
      'price': 89.99,
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU_o6Ye94Xgzuc6_tAWBmYKhqTRK_dwK2vgA&usqp=CAU',
    },
  ];

  static final List<ProductModel> cartItems = [];

  static final List<ProductModel> wishlistItems = [];
}
