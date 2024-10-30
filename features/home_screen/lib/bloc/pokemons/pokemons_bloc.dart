import 'package:common/error/failure_response.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/pokemons/pokemons_state.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class PokemonsBloc extends Cubit<PokemonsState> {
  final PokemonsRepository repository;
  PokemonsBloc({
    required this.repository,
  }) : super(
          PokemonsState(
            statePokemons: ViewData.loading(),
            stateDetailPokemon1: ViewData.initial(),
            stateDetailPokemon2: ViewData.initial(),
          ),
        );
  int currentIndex = 25;

  Future<void> fetchPokemon() async {
    final result = await repository.getPokemons(
      page: currentIndex,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        statePokemons: ViewData.error(
          message: failure.errorMessage,
          failureResponse: failure,
        ),
      )),
      (data) {
        if (data.isEmpty) {
          emit(
            state.copyWith(
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
          emit(state.copyWith(
            statePokemons: ViewData.loaded(
              data: pokemons,
            ),
          ));
          currentIndex += 25;
        }
      },
    );
  }

  Future<void> fetchDetailPokemon({
    required int params,
    required Function() onLoading,
    required Function(PokemonDetailEntity state) onSuccess,
    required Function(FailureResponse failure) onFailure,
  }) async {
    onLoading;
    final result = await repository.getPokemon(
      params: params.toString(),
    );
    result.fold(
      (failure) => onFailure(failure),
      (data) => onSuccess(data),
    );
  }

  Future<void> fetchDetailPokemon1({
    required int params,
  }) async {
    fetchDetailPokemon(
      params: params,
      onLoading: () {
        emit(state.copyWith(stateDetailPokemon1: ViewData.loading()));
      },
      onSuccess: (data) {
        emit(
          state.copyWith(
            stateDetailPokemon1: ViewData.loaded(
              data: data,
            ),
          ),
        );
      },
      onFailure: (failure) {
        emit(
          state.copyWith(
            stateDetailPokemon1: ViewData.error(
              message: failure.errorMessage,
              failureResponse: failure,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchDetailPokemon2({
    required int params,
  }) async {
    fetchDetailPokemon(
      params: params,
      onLoading: () {
        emit(state.copyWith(stateDetailPokemon2: ViewData.loading()));
      },
      onSuccess: (data) {
        emit(
          state.copyWith(
            stateDetailPokemon2: ViewData.loaded(
              data: data,
            ),
          ),
        );
      },
      onFailure: (failure) {
        emit(
          state.copyWith(
            stateDetailPokemon2: ViewData.error(
              message: failure.errorMessage,
              failureResponse: failure,
            ),
          ),
        );
      },
    );
  }

  Future<void> removeComparison() async {
    emit(
      state.copyWith(
        stateDetailPokemon1: ViewData.initial(),
        stateDetailPokemon2: ViewData.initial(),
      ),
    );
  }
}
