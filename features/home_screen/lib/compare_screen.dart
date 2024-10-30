import 'package:common/components/card_pokemon_component.dart';
import 'package:common/components/error_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/extensions/get_svg_source.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc/pokemons/pokemons_bloc.dart';
import 'bloc/pokemons/pokemons_state.dart';
import 'component/chart_component.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
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
      body: SingleChildScrollView(
        child: BlocBuilder<PokemonsBloc, PokemonsState>(
          builder: (context, state) {
            final stateDetail1 = state.stateDetailPokemon1.status;
            final stateDetail2 = state.stateDetailPokemon2.status;
            if (stateDetail1.isInitial) {
              return _choosePokemon((id) {
                context.read<PokemonsBloc>().fetchDetailPokemon1(
                      params: id,
                    );
                Navigator.pop(context);
              });
            }

            if (stateDetail1.isHasData && stateDetail2.isInitial) {
              final dataDetail1 = state.stateDetailPokemon1.data;
              return Column(
                children: [
                  _itemPokemon(dataDetail1!.name, dataDetail1.id),
                  _choosePokemon((id) {
                    context.read<PokemonsBloc>().fetchDetailPokemon2(
                          params: id,
                        );
                    Navigator.pop(context);
                  }),
                ],
              );
            }

            if (stateDetail1.isHasData && stateDetail2.isHasData) {
              final dataDetail1 = state.stateDetailPokemon1.data;
              final dataDetail2 = state.stateDetailPokemon2.data;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _itemPokemon(dataDetail1!.name, dataDetail1.id),
                      _itemPokemon(dataDetail2!.name, dataDetail2.id),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 400,
                    width: double.infinity,
                    child: ChartComponent(
                      pokemon1: dataDetail1.stat,
                      pokemon2: dataDetail2.stat,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<PokemonsBloc>().removeComparison();
                    },
                    child: const Text(
                      "Lakukan Comparasi Ulang",
                    ),
                  )
                ],
              );
            }

            return _choosePokemon((id) {
              context.read<PokemonsBloc>().fetchDetailPokemon1(
                    params: id,
                  );
              Navigator.pop(context);
            });
          },
        ),
      ),
    );
  }

  Widget _choosePokemon(Function(int id) onTap) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      builder: (context, state) {
        final statusPokemon = state.statePokemons.status;
        return Center(
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  if (statusPokemon.isHasData) {
                    final data = state.statePokemons.data;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                            ListView.builder(
                              controller: scrollController,
                              itemCount: data!.length + 1,
                              shrinkWrap: true,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              itemBuilder: (_, index) {
                                if (index < data.length) {
                                  final pokemon = data[index];
                                  return CardPokemonComponent(
                                    pokemonId: pokemon.id,
                                    title: "#${pokemon.id}\n${pokemon.name}",
                                    sourceSvg: pokemon.id.toSvg,
                                    onTap: () {
                                      onTap(pokemon.id);
                                    },
                                  );
                                } else {
                                  return const CupertinoActivityIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (statusPokemon.isLoading) {
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
              );
            },
            child: const Text(
              "Tap Untuk Memilih Pokemon",
            ),
          ),
        );
      },
    );
  }

  Widget _itemPokemon(String name, int id) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.network(
              id.toSvg,
              height: 130,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            name,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
