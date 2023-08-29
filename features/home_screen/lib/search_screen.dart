import 'package:common/components/card_pokemon_component.dart';
import 'package:common/components/error_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/extensions/get_svg_source.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/search_cubit/search_cubit.dart';
import 'package:home_screen/bloc/search_cubit/search_state.dart';
import 'package:home_screen/component/search_component.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController(
    text: "",
  );

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchComponent(
                  searchController: searchController,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    final status = state.stateSearch.status;
                    if (status.isLoading) {
                      return const ShimmerLoadingComponent(
                        height: 70,
                        width: 70,
                      );
                    } else if (status.isHasData &&
                        searchController.text.isNotEmpty) {
                      final data = state.stateSearch.data;
                      return CardPokemonComponent(
                        title: data!.name,
                        sourceSvg: data.id.toSvg,
                        pokemonId: data.id,
                      );
                    } else if (status.isInitial) {
                      return const ErrorComponent(
                        url:
                            "https://www.svgrepo.com/show/390590/find-glass-minus-online-search-seo.svg",
                        message: "Yuk Cari Pokemon Kesayanganmu",
                      );
                    } else {
                      return const ErrorComponent();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
