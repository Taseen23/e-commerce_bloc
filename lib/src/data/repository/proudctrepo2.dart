import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/products_model.dart';

Future<List<ProductModel>?> getproducs() async {
  final List<ProductModel> products = [];
  // final data = await FirebaseFirestore.instance.collection('products').get();
  try {
    final data = await FirebaseFirestore.instance.collection('products').get();
    for (var product in data.docs) {
      products.add(ProductModel.fromJson(product.data()));
    }

    return products;
  } catch (e) {
    return null;
  }

  // print(data.docs.length.toString());
}
