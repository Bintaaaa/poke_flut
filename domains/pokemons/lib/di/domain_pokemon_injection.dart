import 'package:dependencies/get_it/get_it.dart';
import 'package:pokemons/data/datasource/pokemons_remote_datasource.dart';
import 'package:pokemons/data/mapper/pokemon_mappers.dart';
import 'package:pokemons/data/repositories_impl/pokemons_repository_impl.dart';
import 'package:pokemons/domains/repositories/pokemons_repository.dart';

class DomainPokeminInjection {
  DomainPokeminInjection() {
    _registerDatasource();
    _registerMapper();
    _registerRepositories();
  }

  _registerDatasource() => sl.registerLazySingleton<PokemonsRemoteDatasource>(
        () => PokemonsRemoteDatasourceImpl(
          dio: sl(),
        ),
      );

  _registerMapper() => sl.registerLazySingleton<PokemonsMappers>(
        () => PokemonsMappers(),
      );

  _registerRepositories() => sl.registerLazySingleton<PokemonsRepository>(
        () => PokemonsRepositoryImpl(
          datasource: sl(),
          mapper: sl(),
        ),
      );
}
