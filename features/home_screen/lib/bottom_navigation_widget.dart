import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/profile_screen.dart';
import 'package:home_screen/search_screen.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: BottomNavigationScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            context.read<BottomNavigationCubit>().currentIndex(value);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: context
                            .watch<BottomNavigationCubit>()
                            .state
                            .stateBottomNavigation
                            .data ==
                        0
                    ? Colors.green[700]
                    : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                color: context
                            .watch<BottomNavigationCubit>()
                            .state
                            .stateBottomNavigation
                            .data ==
                        1
                    ? Colors.green[700]
                    : Colors.grey,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3_outlined,
                color: context
                            .watch<BottomNavigationCubit>()
                            .state
                            .stateBottomNavigation
                            .data ==
                        2
                    ? Colors.green[700]
                    : Colors.grey,
              ),
              label: "Profile",
            )
          ]),
    );
  }
}

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.watch<BottomNavigationCubit>().state.stateBottomNavigation.data;
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
