import 'package:common/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';

class PokemonsState extends Equatable {
  final ViewData<List<PokemonEntity>> statePokemons;
  final ViewData<PokemonDetailEntity> stateDetailPokemon1;
  final ViewData<PokemonDetailEntity> stateDetailPokemon2;
  final List<PokemonEntity> pokemons = [];

  PokemonsState({
    required this.statePokemons,
    required this.stateDetailPokemon1,
    required this.stateDetailPokemon2,
  });

  PokemonsState copyWith(
          {ViewData<List<PokemonEntity>>? statePokemons,
          ViewData<PokemonDetailEntity>? stateDetailPokemon1,
          ViewData<PokemonDetailEntity>? stateDetailPokemon2}) =>
      PokemonsState(
        statePokemons: statePokemons ?? this.statePokemons,
        stateDetailPokemon1: stateDetailPokemon1 ?? this.stateDetailPokemon1,
        stateDetailPokemon2: stateDetailPokemon2 ?? this.stateDetailPokemon2,
      );

  @override
  List<Object?> get props => [
        statePokemons,
        stateDetailPokemon1,
        stateDetailPokemon2,
      ];
}
