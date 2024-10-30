import 'package:pokemons/domains/entities/pokemon_ability_entity.dart';
import 'package:pokemons/domains/entities/pokemon_statistic_entity.dart';
import 'package:pokemons/domains/entities/pokemon_types_entity.dart';

class PokemonDetailEntity {
  final List<PokemonTypeEntity> types;
  final List<PokemonStatisticEntity> stat;
  final List<PokemonAbilityEntity> abilities;
  final String name;
  final int id;
  final int height;
  final int weight;

  const PokemonDetailEntity({
    required this.id,
    required this.name,
    required this.types,
    required this.height,
    required this.weight,
    required this.stat,
    required this.abilities,
  });
}
