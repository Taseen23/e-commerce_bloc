import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widgets.dart';

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
        actions: [Container(width: 50, child: Icon(Icons.shopping_cart_sharp))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(passdata['brand']),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Price",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text("\$" + passdata["product_price"].toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
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
              ),
              Container(
                height: 50,
                //  width: 150,
                child: BottomButton(
                  backgroundColor: Colors.blue,
                  buttonText: "Add to Cart",
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
