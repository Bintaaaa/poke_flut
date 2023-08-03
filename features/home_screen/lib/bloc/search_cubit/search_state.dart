import 'package:common/state/view_data_state.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';

class SearchState {
  final ViewData<PokemonDetailEntity> stateSearch;
  SearchState({
    required this.stateSearch,
  });
}
