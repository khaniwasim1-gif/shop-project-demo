import 'package:shope/product.dart';



class ProductService {
  static List<Product> fetchProducts() {
    return [
      Product(
        id: '1',
        title: 'Nike Shoes',
        price: 120,
        image: 'assets/images/shoes.jpg',
        description: 'Comfortable running shoes',
      ),
      Product(
        id: '2',
        title: 'Apple Watch',
        price: 250,
        image: 'assets/images/watch.jpg',
        description: 'Smart watch series',
      ),
      Product(
        id: '3',
        title: 'Leather Bag',
        price: 90,
        image: 'assets/images/bag.jpg',
        description: 'Premium leather bag',
      ),
      Product(
        id: '4',
        title: 'T shirt',
        price: 60,
        image: 'assets/images/shirt.jpg',
        description: 'Premium t shirt',
      ),
    ];
  }
}
