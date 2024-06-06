import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/src/data/models/products_model.dart';

import '../dummy/dummyproducts.dart';
import '../models/products2.dart';
import '../models/products3.dart';

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

  final List<ProModel> products = [];
  Future<List<ProModel>> fetchProducts() async {
    try {
      final data = await _firestore.collection('products').get();
      for (var product in data.docs) {
        products.add(ProModel.fromJson(product.data()));
      }
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<ProModel>> getDataStream() async* {
    try {
      final data = await _firestore.collection('products').get();
      for (var product in data.docs) {
        products.add(ProModel.fromJson(product.data()));
      }
      yield products;
    } catch (e) {
      throw Exception(e);
    }
    // FirebaseFirestore.instance.collection("products").snapshots();
    // Simulate some async data fetching
    // await Future.delayed(Duration(seconds: 1));
    // yield ['Item 1', 'Item 2', 'Item 3'];
    // await Future.delayed(Duration(seconds: 2));
    // yield ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }
}
