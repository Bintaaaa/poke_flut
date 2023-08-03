class PokemonStatisticEntity {
  final int baseStat;
  final int effort;
  final PokemonStatEntity? stat;

  PokemonStatisticEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}

class PokemonStatEntity {
  final String name;
  const PokemonStatEntity({
    required this.name,
  });
}
