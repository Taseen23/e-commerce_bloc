import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'src/blocs/blocs.dart';
import 'src/data/preference/local_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = BlocEcommerceObserver();
  await LocalPreferences().init();
  runApp(const EcommerceApp());
}
