import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'carts_provider.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title:  Text('My Cart',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w700),),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,

      ),backgroundColor: Colors.grey,
      body: cart.items.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 16),
        ),
      )
          : Column(
        children: [
          // 🛒 Cart Items
          SizedBox(height: 480,
            child: Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item =
                  cart.items.values.toList()[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    child: Expanded(
                      child: ListTile(
                        leading:CircleAvatar(
                          radius: 80,
                          child: Image.asset(
                            item.image,
                            width: 100,
                            height: 100,
                           //fit: BoxFit.cover,
                          ),
                        ),


                        title: Text(item.title),
                        subtitle: Column(mainAxisAlignment: MainAxisAlignment.center
                          ,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: \$${item.price}\nQuantity: ${item.quantity}',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.remove, size: 20),
                                  onPressed: () {
                                    cart.decreaseQuantity(item.id);
                                  },
                                ),Text(
                                  '${item.quantity}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                 IconButton(
                                  padding: EdgeInsets.all(20),
                                  icon: const Icon(Icons.add, size: 20),
                                  onPressed: () {
                                    cart.increaseQuantity(item.id);
                                  },
                                ),

                              ],
                            ),

                          ],
                        ),

                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // 💰 Total & Checkout
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${cart.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Set the background color here
                      foregroundColor: Colors.white, // Set the text/icon color here
                    ),
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
