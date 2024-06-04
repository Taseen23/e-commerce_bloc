import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/src/data/models/products_model.dart';

import '../dummy/dummyproducts.dart';
import '../models/products2.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> createNewProducts() async {
    try {
      for (var brand in dummyproducts) {
        await _firestore.collection('products').add(brand.toJson());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

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
