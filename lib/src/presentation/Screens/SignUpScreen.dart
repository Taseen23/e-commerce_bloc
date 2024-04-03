import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/register_bloc.dart';
import 'package:e_commerce_bloc/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../routes/route_page.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  context.goNamed(Routes.Home);
                }
                if (state is RegisterFailed) {
                  Fluttertoast.showToast(msg: state.massage);
                }
              },
              builder: (context, state) {
                if (state is RegisterInitial) {
                  return Column(
                    children: [
                      TextField(
                        controller: state.usernmaeController,
                        decoration: InputDecoration(
                          label: const Text("Username"),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                          //  hintText: "Username",
                        ),
                      ),
                      Gap(20),
                      TextField(
                        controller: state.usernmaeController,
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                          //  hintText: "Username",
                        ),
                      ),
                      Gap(20),
                      TextField(
                        controller: state.usernmaeController,
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                          //  hintText: "Username",
                        ),
                      ),
                      Gap(20),
                      TextField(
                        controller: state.usernmaeController,
                        decoration: InputDecoration(
                          label: const Text("Confirm Password"),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                          //  hintText: "Username",
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
        bottomNavigationBar: BlocBuilder<RegisterBloc, RegisterState>(
          builder: ((context, state) {
            return BottomButton(
                buttonText: "Create An Account",
                buttonchild: state is RegisterLoading
                    ? LoadingAnimationWidget.discreteCircle(
                        color: theme.colorScheme.onPrimaryContainer, size: 35.w)
                    : null,
                onTap: () {
                  if (state is RegisterInitial) {
                    context.read<RegisterBloc>().add(RequestEmailSignup(
                        state.usernmaeController.text,
                        state.emiailController.text,
                        state.passwordController.text,
                        state.confirmPassword.text));

                    // ignore: avoid_print
                    return context.goNamed(Routes.Home);
                  }
                });
          }),
        ));
  }
}
