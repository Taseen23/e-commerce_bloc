import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/login_bloc.dart';
import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/register_bloc.dart';
import 'package:e_commerce_bloc/src/blocs/cubit/remember_switch_cubit.dart';
import 'package:e_commerce_bloc/src/presentation/widgets/Bottom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../routes/route_page.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formkey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              Text("please enter your data to continue",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              const Gap(100),
              BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
                if (state is LogingSuccess) {
                  context.goNamed(Routes.Home);
                }
                if (state is LogingFail) {
                  Fluttertoast.showToast(msg: state.massage);
                }
              }, builder: (context, state) {
                if (state is LoginInitial) {
                  return Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                              controller: state.emailController,
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
                              validator: (value) {
                                if (value == " " || value == null) {
                                  return "User Name is required";
                                } else {
                                  return "Null";
                                }
                              }),
                          TextFormField(
                              controller: state.passwordController,
                              decoration: InputDecoration(
                                label: const Text("Password"),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant),
                                //  hintText: "Password",
                              ),
                              validator: (value) {
                                if (value == " " || value == null) {
                                  return "Password is required";
                                } else {
                                  return "Null";
                                }
                              }),
                        ],
                      ));
                } else {
                  return Container();
                }
              }),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Remeber Me"),
                  BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                    builder: (context, state) {
                      return Switch(
                          value: state is SwithChanged ? state.value : true,
                          onChanged: (value) => context
                              .read<RememberSwitchCubit>()
                              .switchToggle(value));
                    },
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<LoginBloc, LoginState>(
          builder: ((context, state) {
            return BottomButton(
                buttonText: "Login",
                buttonchild: state is RegisterLoading
                    ? LoadingAnimationWidget.discreteCircle(
                        color: theme.colorScheme.onPrimaryContainer, size: 35.w)
                    : null,
                onTap: () {
                  if (state is LoginInitial) {
                    if (formkey.currentState!.validate()) {
                      context.read<LoginBloc>().add(RequestEmailLogin(
                          email: state.emailController.text,
                          password: state.passwordController.text,
                          isRemember: RememberSwitchCubit.isRemember));

                      // ignore: avoid_print
                      return context.goNamed(Routes.Home);
                    }
                  }
                });
          }),
        ));
  }
}
