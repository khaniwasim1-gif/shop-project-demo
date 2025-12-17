import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shope/product.dart';



import 'carts_provider.dart';
import 'favorite_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();
    final fav = context.watch<FavoriteProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(product.title,style:GoogleFonts.aBeeZee(fontWeight: FontWeight.w700),),


      ),backgroundColor: Colors.grey,
      body: SizedBox(height: 250,
        child: Card(color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                product.image,
                height: 100,
                fit: BoxFit.cover,
              ),

              Text(product.description),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${product.price}', style: const TextStyle(fontSize: 20)),
                  IconButton(
                    icon: Icon(
                      fav.isFavorite(product.id)
                          ? Icons.favorite
                          : Icons.favorite_border,color: Colors.red,
                    ),
                    onPressed: () => fav.toggleFavorite(product.id),
                  )
                ],
              ),
              ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Set the background color here
                foregroundColor: Colors.white, // Set the text/icon color here
              ),
                onPressed: () {
                  cart.addToCart(product);
                  Navigator.pop(context);
                },
                child: const Text('Add to Cart'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
