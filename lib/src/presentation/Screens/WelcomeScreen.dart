import 'package:e_commerce_bloc/src/presentation/widgets/Bottom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../blocs/Authentication/bloc/login_bloc.dart';
import '../../routes/route_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Let's Get Started",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (State is LogingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        onPressed: () {},
                      ),
                      const Gap(10),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.twitter,
                        onPressed: () {},
                      ),
                      const Gap(10),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () =>
                            context.read<LoginBloc>().add(RequestGoogleLogin()),
                      )
                    ],
                  ),
                );
              },
            ),
            const Gap(150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                TextButton(
                    onPressed: () => context.pushNamed(Routes.LoginScreen),
                    child: Text("singin",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface)))
              ],
            ),
            BottomButton(
              buttonText: "Sign Up",
              onTap: () => context.pushNamed(Routes.SignupScreen),
            )
          ],
        ));
  }
}
