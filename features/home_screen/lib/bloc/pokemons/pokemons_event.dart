import 'package:pokemons/domains/entities/pokemons_entities.dart';

abstract class PokemonsEvent {
  const PokemonsEvent();
}

class GetPokemons extends PokemonsEvent {
  const GetPokemons();
}
