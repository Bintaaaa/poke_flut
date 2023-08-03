import 'package:common/components/card_pokemon_component.dart';
import 'package:common/components/error_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/extensions/get_svg_source.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/pokemons/pokemons_bloc.dart';
import 'package:home_screen/bloc/pokemons/pokemons_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: BlocBuilder<PokemonsBloc, PokemonsState>(
            builder: (context, state) {
              final status = state.statePokemons?.status;
              if (status!.isHasData) {
                final data = state.statePokemons!.data;

                return ListView.builder(
                  itemCount: data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CardPokemonComponent(
                      title: "#${data?[index].id}\n${data?[index].name}",
                      ability: const ["Terbang", "Melayang"],
                      sourceSvg: data![index].id.toSvg,
                    );
                  },
                );
              } else if (status.isLoading) {
                return ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ShimmerLoadingComponent();
                  },
                );
              } else {
                return const ErrorComponent();
              }
            },
          ),
        ),
      ),
    );
  }
}
