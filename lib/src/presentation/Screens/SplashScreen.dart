import 'package:e_commerce_bloc/src/blocs/cubit/splash_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashEnd) {
            context.goNamed(Routes.WelcomeScreen);
          }
        },
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/applogo.svg",
            width: 59.h,
            height: 80.w,
          ),
        ),
      ),
    );
  }
}
