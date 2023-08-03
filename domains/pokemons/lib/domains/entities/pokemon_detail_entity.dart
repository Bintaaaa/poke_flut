import 'package:pokemons/domains/entities/pokemon_types_entity.dart';

class PokemonDetailEntity {
  final List<PokemonTypeEntity> types;

  const PokemonDetailEntity({
    required this.types,
  });
}
