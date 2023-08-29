import 'dart:convert';
import 'dart:io';

import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemons/data/datasource/pokemons_remote_datasource.dart';
import 'package:pokemons/data/model/pokemond_model_dto.dart';

import 'pokemons_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio, PokemonsRemoteDatasource])
void main() {
  late PokemonsRemoteDatasourceImpl pokemonsRemoteDatasourceImpl;
  late Dio mockDio;

  setUp(() {
    mockDio = MockDio();
    pokemonsRemoteDatasourceImpl = PokemonsRemoteDatasourceImpl(dio: mockDio);
  });

  group("Get Pokemons", () {
    test("Should return list of Pokemons when Response code 200 ", () async {
      final expectation = PokemonModelDTO.fromJson(
        readJson("./json/pokemons.json"),
      );

      when(
        mockDio.get(ConstanValues.apiConstans.pokemons, queryParameters: {
          "page": 30,
          "limit": 30,
        }),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ""),
          data: readJson("./json/pokemons.json"),
        ),
      );

      final response = await pokemonsRemoteDatasourceImpl.getPokemons(page: 30);

      expect(response, equals(expectation));
    });
  });
}

Map<String, dynamic> readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  final file = File('$dir/test/$name').readAsStringSync();

  return jsonDecode(file);
}
