import 'package:e_commerce_bloc/src/presentation/Screens/LoginScreen.dart';
import 'package:e_commerce_bloc/src/presentation/Screens/SignUpScreen.dart';
import 'package:e_commerce_bloc/src/presentation/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/services/auth_service.dart';
import '../presentation/Screens/HomeScreen.dart';
import '../presentation/Screens/WelcomeScreen.dart';
import '../presentation/Screens/wrapper.dart';

part 'routes.dart';

class RoutePages {
  static final authService = AuthService();
  static final ROUTER = GoRouter(
      redirect: (context, state) {
        if (authService.checkLoginStatus()) {
          if (state.fullPath == Routes.LoginScreen ||
              state.fullPath == Routes.SignupScreen ||
              state.fullPath == Routes.WelcomeScreen) {
            return Routes.Home;
          } else {
            return state.fullPath;
          }
        } else {
          if (state.fullPath == Routes.LoginScreen ||
              state.fullPath == Routes.SignupScreen) {
            return state.fullPath;
          }
          return Routes.WelcomeScreen;
        }
      },
      routes: [
        GoRoute(
          path: Routes.Home,
          name: Routes.Home,
          pageBuilder: (context, state) =>
              const MaterialPage(child: HomeScreen()),
        ),
        GoRoute(
          path: Routes.LoginScreen,
          name: Routes.LoginScreen,
          pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
        ),
        GoRoute(
          path: Routes.WelcomeScreen,
          name: Routes.WelcomeScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: WelcomeScreen()),
        ),
        GoRoute(
          path: Routes.SplashScreen,
          name: Routes.SplashScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SplashScreen()),
        ),
        GoRoute(
          path: Routes.SignupScreen,
          name: Routes.SignupScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SignUpScreen()),
        ),
        // ShellRoute(
        //   builder: (context, state, child) => Wrapper(child: child),
        //   routes: [
        //     GoRoute(
        //         path: Routes.Home,
        //         name: Routes.Home,
        //         pageBuilder: (context, state) =>
        //             const MaterialPage(child: HomeScreen()))
        //   ],
        // ),
      ]);
}
