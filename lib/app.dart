import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/login_bloc.dart';
import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/register_bloc.dart';
import 'package:e_commerce_bloc/src/blocs/Profile/bloc/profile_bloc.dart';
import 'package:e_commerce_bloc/src/blocs/cubit/remember_switch_cubit.dart';
import 'package:e_commerce_bloc/src/blocs/cubit/splash_cubit.dart';
import 'package:e_commerce_bloc/src/data/repository/authrepository.dart';
import 'package:e_commerce_bloc/src/routes/route_page.dart';
import 'package:e_commerce_bloc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/data/repository/storerepository.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: ((context) => AuthRepository())),
          RepositoryProvider(create: ((context) => StoreRepository()))
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SplashCubit()..startSplash(),
              ),
              BlocProvider(
                create: (context) => RememberSwitchCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    RegisterBloc(context.read<AuthRepository>()),
              ),
              BlocProvider(
                create: (context) => LoginBloc(context.read<AuthRepository>()),
              ),
            ],
            child: ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: const MaterialTheme(TextTheme()).light(),
                darkTheme: const MaterialTheme(TextTheme()).dark(),
                routerConfig: RoutePages.ROUTER,
              ),
            )));
  }
}
