import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/src/data/models/products_model.dart';

import '../models/products2.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<ImageModel> products = [];
  Future<List<ImageModel>> fetchProducts() async {
    try {
      final data = await _firestore.collection('products').get();
      for (var product in data.docs) {
        products.add(ImageModel.fromJson(product.data()));
      }
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
