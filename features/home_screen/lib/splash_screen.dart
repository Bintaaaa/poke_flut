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
      body: BlocListener<SplashScreenCubit, SplashScreenState>(
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
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/splash.png",
              ),
            ),
          ),
          child: const Text(
            "Welcome to,\nTeknikal Test Bijantium",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
