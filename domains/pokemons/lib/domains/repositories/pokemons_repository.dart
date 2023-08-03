import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';

abstract class PokemonsRepository {
  Future<Either<FailureResponse, List<PokemonEntity>>> getPokemons({
    int page = 30,
  });

  Future<Either<FailureResponse, PokemonDetailEntity>> getPokemon({
    required String params,
  });
}
