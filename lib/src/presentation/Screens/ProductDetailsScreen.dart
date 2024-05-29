import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String pdetails;
  const ProductDetails({
    Key? key,
    required this.pdetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Details"),
      ),
      body: Column(
        children: [
          //Text(pdetails.),
        ],
      ),
    );
  }
}
