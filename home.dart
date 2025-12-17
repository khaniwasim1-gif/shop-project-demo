import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shope/product_detail.dart';
import 'package:shope/provider_product.dart';


import 'carts_provider.dart';
import 'favorite.dart';

import 'cart_screen.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title:  Text('Home',style:GoogleFonts.aBeeZee(fontWeight: FontWeight.w700)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoriteScreen()),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              if (cart.items.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    child: Text(
                      cart.items.length.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              children: [
                Image.asset(
                  product.image,
                  height: 100,
                  fit: BoxFit.cover,
                ),

                Text(product.title),
                Text('\$${product.price}'),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Set the background color here
                  foregroundColor: Colors.white, // Set the text/icon color here
                ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: const Text('View'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
