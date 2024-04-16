import 'package:e_commerce_bloc/src/blocs/Authentication/bloc/login_bloc.dart';
import 'package:e_commerce_bloc/src/routes/route_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../data/preference/local_preferences.dart';
import '../../utlls/values.dart';
import '../widgets/Search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  '${Values.GREETINGS} ${LocalPreferences.getString('username')}'),
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
                    'Choose Brand',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: theme.textTheme.labelSmall,
                  )
                ],
              ),
            ),
            const Gap(10),
            /*
            SizedBox(
              height: layout.width * 0.13,
              child: BlocBuilder<BrandBloc, BrandState>(
                builder: (context, state) {
                  if (state is BrandFetchSuccess) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const Gap(10);
                        }
                        return BrandCard(
                          brandLogo: state.brands[index - 1].brandLogo,
                          brandTitle: state.brands[index - 1].brandName,
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(8.0),
                      itemCount: state.brands.length + 1,
                    );
                  } else {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          ShimmerEffect.rectangular(
                              width: 70, height: layout.width * 0.13),
                      separatorBuilder: (context, index) => const Gap(8.0),
                      itemCount: 10,
                    );
                  }
                },
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
