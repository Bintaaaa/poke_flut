import 'dart:io';

import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:pokemons/data/datasource/pokemons_remote_datasource.dart';
import 'package:pokemons/data/mapper/pokemon_mappers.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class PokemonsRepositoryImpl extends PokemonsRepository {
  final PokemonsRemoteDatasource datasource;
  final PokemonsMappers mapper;
  PokemonsRepositoryImpl({
    required this.datasource,
    required this.mapper,
  });
  @override
  Future<Either<FailureResponse, List<PokemonEntity>>> getPokemons({
    int page = 30,
  }) async {
    try {
      final result = await datasource.getPokemons(page: page);
      return Right(
        mapper.pokemonsModelToEntity(
          result,
        ),
      );
    } on SocketException {
      return const Left(
        FailureResponse(
          errorMessage: "Koneksimu tidak stabil, silahkan coba lagi",
        ),
      );
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage: error.response?.data['message'].toString() ??
              "Something Wrong Error",
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, PokemonDetailEntity>> getPokemon(
      {required String params}) async {
    try {
      final result = await datasource.getPokemon(
        params: params,
      );
      return Right(
        mapper.pokemonDetailModelToEntity(
          result,
        ),
      );
    } on SocketException {
      return const Left(
        FailureResponse(
          errorMessage: "Koneksimu tidak stabil, silahkan coba lagi",
        ),
      );
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          errorMessage: error.response?.data['message'].toString() ??
              "Something Wrong Error",
        ),
      );
    }
  }
}
