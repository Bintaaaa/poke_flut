import 'package:common/components/card_pokemon_component.dart';
import 'package:common/components/error_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/extensions/get_svg_source.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/pokemons/pokemons_bloc.dart';
import 'package:home_screen/bloc/pokemons/pokemons_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<PokemonsBloc>().fetchPokemon();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mohammad Bijantium Sinatria",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: BlocBuilder<PokemonsBloc, PokemonsState>(
            builder: (context, state) {
              final status = state.statePokemons.status;
              if (status.isHasData) {
                final data = state.statePokemons.data;
                return ListView.builder(
                  controller: scrollController,
                  itemCount: data!.length + 1,
                  shrinkWrap: true,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  itemBuilder: (context, index) {
                    if (index < data.length) {
                      return CardPokemonComponent(
                        pokemonId: data[index].id,
                        title: "#${data[index].id}\n${data[index].name}",
                        sourceSvg: data[index].id.toSvg,
                      );
                    } else {
                      return const CupertinoActivityIndicator();
                    }
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
