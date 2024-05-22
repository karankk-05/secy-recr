import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final List<String> imageUrls;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrls,
  });
}



class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(Product updatedProduct) {
    final index = _products.indexWhere((product) => product.name == updatedProduct.name);
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String name) {
    _products.removeWhere((product) => product.name == name);
    notifyListeners();
  }
}

