import 'package:common/state/view_data_state.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';

class PokemonsState {
  ViewData<List<PokemonEntity>> statePokemons;
  List<PokemonEntity> pokemons = [];
  PokemonsState({
    required this.statePokemons,
  });
}
