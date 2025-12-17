import 'package:flutter/material.dart';
import 'package:shope/product.dart';
import 'package:shope/product_services.dart';


class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  ProductProvider() {
    _products = ProductService.fetchProducts();
  }
}
