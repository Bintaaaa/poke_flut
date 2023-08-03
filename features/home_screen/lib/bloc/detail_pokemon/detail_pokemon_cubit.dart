import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/detail_pokemon/detail_pokemon_state.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class DetailPokemonCubit extends Cubit<DetailPokemonState> {
  final PokemonsRepository repository;

  DetailPokemonCubit({
    required this.repository,
  }) : super(
          DetailPokemonState(
            stateDetailPokemon: ViewData.initial(),
          ),
        );

  Future<void> fetchDetailPokemon({
    required int params,
  }) async {
    emit(
      DetailPokemonState(stateDetailPokemon: ViewData.loading()),
    );
    final result = await repository.getPokemon(
      params: params.toString(),
    );
    result.fold(
      (failure) => emit(
        DetailPokemonState(
          stateDetailPokemon: ViewData.error(
            message: failure.errorMessage,
            failureResponse: failure,
          ),
        ),
      ),
      (data) {
        emit(
          DetailPokemonState(
            stateDetailPokemon: ViewData.loaded(
              data: data,
            ),
          ),
        );
      },
    );
  }
}
