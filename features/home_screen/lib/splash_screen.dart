import 'package:common/core/constans/routes_constans.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/splash/splash_screen_cubit.dart';
import 'package:home_screen/bloc/splash/splash_screen_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashScreenCubit, SplashScreenState>(
          listener: (context, state) {
            final status = state.stateSplahScreen.status;
            if (status.isHasData) {
              Navigator.pushReplacementNamed(
                context,
                RoutesConstans.bottomNavigation,
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.all(
              16.0,
            ),
            alignment: Alignment.center,
            child: const Text(
              "Hello, I'm Bijantyum",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
