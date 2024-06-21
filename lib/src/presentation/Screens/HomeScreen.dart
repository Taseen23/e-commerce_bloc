import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/login_bloc.dart';
import 'package:e_commerce_bloc/src/data/repository/proudctrepo2.dart';
import 'package:e_commerce_bloc/src/presentation/Screens/DetailsScreen.dart';
import 'package:e_commerce_bloc/src/presentation/Screens/Sreens.dart';

import 'package:e_commerce_bloc/src/presentation/widgets/widgets.dart';
import 'package:e_commerce_bloc/src/routes/route_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../data/preference/local_preferences.dart';
import '../../data/repository/productrepository.dart';
import '../../utlls/values.dart';
import '../widgets/Search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    ProductRepository obj = ProductRepository();
    final layout = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LogOutSuccess) {
                context.goNamed(Routes.WelcomeScreen);
              }
              if (state is LogOutFailed) {
                Fluttertoast.showToast(msg: state.massage);
              }

              // TODO: implement listener
            },
            child: IconButton.filled(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(theme.colorScheme.surfaceVariant),
              ),
              onPressed: () => context.read<LoginBloc>().add(RequestSignOut()),
              icon: const Icon(Icons.logout_rounded),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                  '${Values.GREETINGS} ${LocalPreferences.getString('email')}'),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              subtitle: const Text(Values.WELCOME_SUB_TITLE),
              subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
            ),
            const CustomSearchBar(),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Products',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Filters',
                    style: theme.textTheme.labelSmall,
                  )
                ],
              ),
            ),
            const Gap(10),

            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return Center(child: Text('No data found'));
                  }
                  return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final pro = snapshot.data!.docs[index];

                            print(pro["product_details"]);
                            return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return DetailsScreen(passdata: pro.data());
                                  })));
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        pro['brand'].toString(),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(pro["product_name"]),
                                        Text(
                                          "\$" +
                                              pro["product_price"].toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        //Text(pro['price'].toString())
                                      ],
                                    )
                                  ],
                                ));
                          }));
                }),

            // FutureBuilder(
            //   future: getproduct(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(child: CircularProgressIndicator());
            //     }

            //     if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     }

            //     if (!snapshot.hasData || snapshot.data == null) {
            //       return Center(child: Text('No data found'));
            //     }

            //     List products = snapshot.data!;
            //     print(products);

            //     return Expanded(
            //       child: GridView.builder(
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //         ),
            //         itemCount: products.length,
            //         itemBuilder: (context, index) {
            //           final pro = snapshot.data![index];
            //           return Text(pro.productName.toString());
            //         },
            //       ),
            //     );
            //   },
            // )
            // // Expanded(
            // //   child: GridView.builder(
            // //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // //       crossAxisCount: 2,
            // //     ),
            // //     //  itemCount: 10, // Assuming you have 10 items, adjust accordingly
            // //     itemBuilder: (context, index) {
            // //       return Text("hello");

            // //     },
            // //   ),
            // // )
          ],
        ),
      ),
    );
  }
}
