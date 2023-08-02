import 'package:common/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home_screen/bloc/pokemons/pokemons_event.dart';
import 'package:home_screen/bloc/pokemons/pokemons_state.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final PokemonsRepository repository;
  PokemonsBloc({
    required this.repository,
  }) : super(
          PokemonsState(
            statePokemons: ViewData.initial(),
          ),
        ) {
    on<GetPokemons>(
      (event, emit) async {
        emit(
          PokemonsState(
            statePokemons: ViewData.loading(),
          ),
        );
        final result = await repository.getAllPokemons();

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
              emit(
                PokemonsState(
                  statePokemons: ViewData.loaded(
                    data: data,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
