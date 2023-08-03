import 'package:common/components/chip_ability_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/core/constans/routes_constans.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_cubit.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_state.dart';

class CardPokemonComponent extends StatefulWidget {
  final int pokemonId;
  final String title;
  final String sourceSvg;
  const CardPokemonComponent({
    super.key,
    required this.title,
    required this.sourceSvg,
    required this.pokemonId,
  });

  @override
  State<CardPokemonComponent> createState() => _CardPokemonComponentState();
}

class _CardPokemonComponentState extends State<CardPokemonComponent> {
  @override
  void initState() {
    super.initState();
    context.read<DetailPokemonCubit>().fetchDetailPokemon(
          params: widget.pokemonId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesConstans.detailPage,
          arguments: widget.pokemonId,
        );
      },
      child: Container(
        height: 130.0,
        padding: const EdgeInsets.all(
          16.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.green[400],
          borderRadius: BorderRadius.circular(
            18.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 2,
                    child: BlocBuilder<DetailPokemonCubit, DetailPokemonState>(
                      builder: (context, state) {
                        final status = state.stateDetailPokemon.status;
                        if (status.isHasData) {
                          final data = state.stateDetailPokemon.data;

                          return ListView.builder(
                            itemCount: data?.types.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ChipAbilityPokemon(
                                title: data!.types[index].type.name,
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            itemCount: 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const ShimmerLoadingComponent(
                                width: 60,
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(
                        300.0,
                      ),
                    ),
                  ),
                  Hero(
                    tag: widget.sourceSvg,
                    child: SvgPicture.network(
                      widget.sourceSvg,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
