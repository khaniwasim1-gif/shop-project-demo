import 'package:flutter/material.dart';
import 'package:shope/product.dart';

import 'carts_items.dart';


class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalPrice {
    double total = 0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(
        id: product.id,
        title: product.title,
        price: product.price,
        quantity: 1,
        image: product.image,
      );
    }
    notifyListeners();
  }

  void increaseQuantity(String id) {
    _items[id]!.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    if (_items[id]!.quantity > 1) {
      _items[id]!.quantity--;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }
}
