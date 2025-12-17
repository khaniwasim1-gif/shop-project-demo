import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shope/provider_product.dart';

import 'favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteProvider>();
    final products = context.watch<ProductProvider>().products;

    // 🔥 Filter favorite products
    final favoriteProducts =
    products.where((p) => fav.favoriteIds.contains(p.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title:  Text('Favorites',style:GoogleFonts.aBeeZee(fontWeight: FontWeight.w700),
      ),
      foregroundColor: Colors.white,
      centerTitle: true,
        backgroundColor: Colors.blueGrey,),
      backgroundColor: Colors.grey,
      body: favoriteProducts.isEmpty
          ? const Center(
        child: Text(
          'No favorites yet',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];

          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Image.asset(

                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,


            ),
              title: Text(product.title),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  fav.toggleFavorite(product.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
