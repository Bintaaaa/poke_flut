import 'package:common/components/chip_ability_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/extensions/get_svg_source.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_cubit.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_state.dart';

class HeaderDetailPokemonWidget extends StatelessWidget {
  const HeaderDetailPokemonWidget({
    super.key,
    required this.args,
  });

  final int args;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailPokemonCubit, DetailPokemonState>(
      builder: (context, state) {
        final status = state.stateDetailPokemon.status;
        if (status.isHasData) {
          final data = state.stateDetailPokemon.data;
          return Container(
            height: MediaQuery.of(context).size.height / 4,
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: args.toSvg,
                    child: SvgPicture.network(
                      args.toSvg,
                      height: 130,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#$args",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        data!.name,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child:
                            BlocBuilder<DetailPokemonCubit, DetailPokemonState>(
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (status.isLoading) {
          return const Row(
            children: [
              ShimmerLoadingComponent(
                height: 100,
                width: 100,
              ),
              Column(
                children: [
                  ShimmerLoadingComponent(
                    width: 50,
                    height: 30,
                  ),
                  ShimmerLoadingComponent(
                    height: 30,
                    width: 70,
                  ),
                  ShimmerLoadingComponent(
                    height: 30,
                    width: 0,
                  )
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
