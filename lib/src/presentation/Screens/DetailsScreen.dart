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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              passdata["product_name"],
              height: 150,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Price",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(passdata["product_price"].toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),

            // Text(
            //   "Product Price  ${passdata["product_price"].toString()}",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            //FittedBox(),
            ListTile(
              title: Text(passdata["product_details"]),
              //leading: Text(passdata["product_details"]),
            )
          ],
        ),
      ),
    );
  }
}
