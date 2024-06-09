import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> passdata;
  const DetailsScreen({
    Key? key,
    required this.passdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Details"),
      ),
      body: Column(
        children: [
          Image.network(passdata["brands"].toString(), fit: BoxFit.fill),
        ],
      ),
    );
  }
}
