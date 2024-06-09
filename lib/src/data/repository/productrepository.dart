import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/products_model.dart';
class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProduct() async {
    final List<ProductModel> products = [];
    try {
      final data = await _firestore.collection('products').get();
      for (var product in data.docs) {
        final singleProduct = ProductModel.fromJson(product.data());
        singleProduct.productId = product.id;
        products.add(singleProduct);
      }
      return products;
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception(e);
    }
  }
  Future<ProductModel?> fetchSingleProduct(String productId) async {
    try {
      final data = await _firestore.collection('products').doc(productId).get();

      if(data.data() != null){
        final product = ProductModel.fromJson(data.data()!);
        product.productId = data.id;
        return product;
      } else {
        return null;
      }

    } catch (e) {
      debugPrint('Error: $e');
      throw Exception(e);
    }
  }
}
