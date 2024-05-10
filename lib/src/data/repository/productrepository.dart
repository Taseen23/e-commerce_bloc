import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/src/data/models/products_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<ProductModel> products = [];
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final data = await _firestore.collection('products').get();
      for (var product in data.docs) {
        products.add(ProductModel.fromJson(product.data()));
      }
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
