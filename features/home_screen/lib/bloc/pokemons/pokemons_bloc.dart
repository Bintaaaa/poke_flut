import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/pokemons/pokemons_state.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class PokemonsBloc extends Cubit<PokemonsState> {
  final PokemonsRepository repository;
  PokemonsBloc({
    required this.repository,
  }) : super(
          PokemonsState(
            statePokemons: ViewData.loading(),
          ),
        );
  int currentIndex = 25;

  Future<void> fetchPokemon() async {
    final result = await repository.getPokemons(
      page: currentIndex,
    );

    result.fold(
      (failure) => emit(
        PokemonsState(
          statePokemons: ViewData.error(
            message: failure.errorMessage,
            failureResponse: failure,
          ),
        ),
      ),
      (data) {
        if (data.isEmpty) {
          emit(
            PokemonsState(
              statePokemons: ViewData.noData(
                message: "No Data",
              ),
            ),
          );
        } else {
          List<PokemonEntity> pokemons = [];
          pokemons.addAll(
            data,
          );
          emit(
            PokemonsState(
              statePokemons: ViewData.loaded(
                data: pokemons,
              ),
            ),
          );
          currentIndex += 25;
        }
      },
    );
  }
}
