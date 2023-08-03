import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/search_cubit/search_state.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final PokemonsRepository repository;

  SearchCubit({
    required this.repository,
  }) : super(
          SearchState(
            stateSearch: ViewData.initial(),
          ),
        );

  Future<void> fetchDetailPokemon({
    required String params,
  }) async {
    emit(
      SearchState(stateSearch: ViewData.loading()),
    );
    final result = await repository.getPokemon(
      params: params.toString(),
    );
    result.fold(
      (failure) => emit(
        SearchState(
          stateSearch: ViewData.error(
            message: failure.errorMessage,
            failureResponse: failure,
          ),
        ),
      ),
      (data) {
        emit(
          SearchState(
            stateSearch: ViewData.loaded(
              data: data,
            ),
          ),
        );
      },
    );
  }
}
