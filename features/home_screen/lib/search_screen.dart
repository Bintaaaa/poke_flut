import 'package:common/components/card_pokemon_component.dart';
import 'package:common/components/error_component.dart';
import 'package:common/components/shimmer_loading_component.dart';
import 'package:common/extensions/get_svg_source.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/bloc/search_cubit/search_cubit.dart';
import 'package:home_screen/bloc/search_cubit/search_state.dart';

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

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: (params) {
        context.read<SearchCubit>().fetchDetailPokemon(
              params: params,
            );
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        hintText: "Search Pokemon By Name...",
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFFB3B1B1),
        ), // TextStyle
        suffixIcon: const Icon(
          Icons.search,
          size: 26,
          color: Colors.black54,
        ), // Icon
        /* -- Border Styling -- */
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xFFFF0000),
          ), // BorderSide
        ), // OutlineInputBorder
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.grey,
          ), // BorderSide
        ), // OutlineInputBorder
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.grey,
          ), // BorderSide
        ),
        // OutlineInputBorder
      ), // InputDecoration
    );
  }
}
