import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';

abstract class PokemonsRepository {
  Future<Either<FailureResponse, List<PokemonEntity>>> getAllPokemons();
}
