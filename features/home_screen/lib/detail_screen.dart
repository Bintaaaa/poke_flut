import 'package:common/components/spesification_component.dart';
import 'package:common/components/statistic_component.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_cubit.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_state.dart';
import 'package:home_screen/bloc/detail_pokemon/widget/header_detail_pokemon_widget.dart';

class DetailScreen extends StatelessWidget {
  final int args;
  const DetailScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 214, 141),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 130, 214, 141),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              18.0,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: BlocBuilder<DetailPokemonCubit, DetailPokemonState>(
            builder: (context, state) {
              final status = state.stateDetailPokemon.status;
              if (status.isHasData) {
                final data = state.stateDetailPokemon.data;
                return Container(
                  margin: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Data Pokemon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green[700],
                        ),
                      ),
                      SpesificationComponent(
                        title: "Height",
                        subTitle: "${data!.height} cm",
                      ),
                      SpesificationComponent(
                        title: "Weight",
                        subTitle: "${data.weight} mg",
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Base Stat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green[700],
                        ),
                      ),
                      ListView.builder(
                        itemCount: data.stat.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return StatisticPokemonComponent(
                            title: data.stat[index].stat!.name,
                            value: data.stat[index].baseStat,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      body: SafeArea(
        child: HeaderDetailPokemonWidget(args: args),
      ),
    );
  }
}
