import 'package:common/state/view_data_state.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';

class DetailPokemonState {
  final ViewData<PokemonDetailEntity> stateDetailPokemon;

  DetailPokemonState({
    required this.stateDetailPokemon,
  });
}
