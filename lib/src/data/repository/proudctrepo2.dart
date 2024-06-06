import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/products2.dart';
import '../models/products_model.dart';

Future<List<ImageModel>?> getproducts() async {
  final List<ImageModel> products = [];
  // final data = await FirebaseFirestore.instance.collection('products').get();
  try {
    final data = await FirebaseFirestore.instance.collection('products').get();
    for (var product in data.docs) {
      products.add(ImageModel.fromJson(product.data()));
    }

    return products;
  } catch (e) {
    return null;
  }

  // print(data.docs.length.toString());
}

Future<List<ProductModel>?> getproduct() async {
  final List<ProductModel> products = [];
  // final data = await FirebaseFirestore.instance.collection('products').get();
  try {
    final data = await FirebaseFirestore.instance.collection('shirts').get();
    for (var product in data.docs) {
      products.add(ProductModel.fromJson(product.data()));
    }

    return products;
  } catch (e) {
    return null;
  }

  // print(data.docs.length.toString());
}
