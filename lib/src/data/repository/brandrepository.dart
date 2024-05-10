import 'package:cloud_firestore/cloud_firestore.dart';

getusers() async {
  final data = await FirebaseFirestore.instance.collection('brands').get();
  print(data.docs.length.toString());
}
