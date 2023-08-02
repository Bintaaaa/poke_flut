import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:pokemons/data/model/pokemond_model_dto.dart';

abstract class PokemonsRemoteDatasource {
  Future<PokemonModelDTO> getPokemons();
}

class PokemonsRemoteDatasourceImpl implements PokemonsRemoteDatasource {
  const PokemonsRemoteDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<PokemonModelDTO> getPokemons() async {
    try {
      final response = await dio.get(
        ConstanValues.apiConstans.pokemons,
      );
      return PokemonModelDTO.fromJson(
        response.data,
      );
    } catch (e) {
      rethrow;
    }
  }
}
