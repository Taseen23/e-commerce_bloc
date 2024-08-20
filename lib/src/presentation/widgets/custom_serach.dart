import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSeach extends StatefulWidget {
  const CustomSeach({super.key});

  @override
  State<CustomSeach> createState() => _CustomSeachState();
}

class _CustomSeachState extends State<CustomSeach> {
  List serachResult = [];
  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('products')
        .where("product_name", isEqualTo: query)
        .get();
    setState(() {
      serachResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          onChanged: (query) {
            searchFromFirebase(query);
          },
          hintText: "Serach Products",
        ),
        Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: serachResult.length,
                itemBuilder: (context, index) {
                  final pro = serachResult[index];

                  print(pro["product_details"]);
                  return InkWell(
                    // onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: ((context) {
                    //     return DetailsScreen(passdata: pro.data());
                    //   })));
                    // },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            pro['brand'].toString(),
                          ),
                        ),
                        Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pro["product_name"]),
                            Text(
                              "\$" + pro["product_price"].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            //Text(pro['price'].toString())
                          ],
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
