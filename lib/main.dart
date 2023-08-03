// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:common/core/constans/routes_constans.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:home_screen/bloc/pokemons/pokemons_bloc.dart';
import 'package:home_screen/bloc/pokemons/pokemons_event.dart';
import 'package:home_screen/bloc/splash/splash_screen_cubit.dart';
import 'package:home_screen/bottom_navigation_widget.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/splash_screen.dart';
import 'package:poke_flut/injections/injections.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ),
        useMaterial3: true,
      ),
      initialRoute: RoutesConstans.splashScreen,
      routes: {
        RoutesConstans.splashScreen: (_) => BlocProvider(
              create: (_) => SplashScreenCubit()..timerSplash(),
              child: const SplashScreen(),
            ),
        RoutesConstans.bottomNavigation: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<BottomNavigationCubit>(
                  create: (_) => BottomNavigationCubit(),
                  child: const SplashScreen(),
                ),
                BlocProvider<PokemonsBloc>(
                  create: (_) => PokemonsBloc(
                    repository: sl(),
                  )..add(
                      const GetPokemons(),
                    ),
                  child: const HomeScreen(),
                ),
              ],
              child: const BottomNavigationWidget(),
            ),
      },
    );
  }
}