import 'package:common/extensions/get_id_extension.dart';
import 'package:common/extensions/string_converter.dart';
import 'package:pokemons/data/model/pokemon_detail_model_dto.dart';
import 'package:pokemons/data/model/pokemond_model_dto.dart';
import 'package:pokemons/domains/entities/pokemon_ability_entity.dart';
import 'package:pokemons/domains/entities/pokemon_detail_entity.dart';
import 'package:pokemons/domains/entities/pokemon_statistic_entity.dart';
import 'package:pokemons/domains/entities/pokemon_types_entity.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';

class PokemonsMappers {
  List<PokemonEntity> pokemonsModelToEntity(PokemonModelDTO data) {
    List<PokemonEntity> pokemons = [];
    for (PokemonResultDTO item in data.results!) {
      pokemons.add(
        PokemonEntity(
          name: (item.name ?? "-").toUpperCase(),
          id: (item.url ?? "1").convertToId,
        ),
      );
    }
    return pokemons;
  }

  PokemonDetailEntity pokemonDetailModelToEntity(PokemonDetailModelDTO data) => PokemonDetailEntity(
        id: data.id ?? 0,
        name: (data.name ?? "-").toUpperCase(),
        weight: data.weight ?? 0,
        height: data.height ?? -1,
        types: pokemonTypeModelToEntity(
          data,
        ),
        stat: pokemonStatisticModelToEntity(
          data,
        ),
        abilities: pokemonAbilityModelToEntity(data),
      );

  List<PokemonStatisticEntity> pokemonStatisticModelToEntity(PokemonDetailModelDTO data) {
    List<PokemonStatisticEntity> stat = [];
    for (PokemonStatisticModelDTO item in data.stats!) {
      stat.add(
        PokemonStatisticEntity(
          baseStat: item.baseStat ?? 0,
          effort: item.effort ?? 0,
          stat: pokemonDataStatisticModelToEntity(
            item.stat ?? PokemonSpeciesModelDTo(),
          ),
        ),
      );
    }
    return stat;
  }

  List<PokemonAbilityEntity> pokemonAbilityModelToEntity(PokemonDetailModelDTO data) {
    List<PokemonAbilityEntity> abilities = [];
    for (Ability item in data.abilities!) {
      abilities.add(
        PokemonAbilityEntity(
          name: item.ability?.name ?? "",
          url: item.ability?.url ?? "",
        ),
      );
    }
    return abilities;
  }

  PokemonStatEntity pokemonDataStatisticModelToEntity(PokemonSpeciesModelDTo data) => PokemonStatEntity(
        name: (data.name ?? "").capitalizeEachWordDash(),
      );

  List<PokemonTypeEntity> pokemonTypeModelToEntity(PokemonDetailModelDTO data) {
    List<PokemonTypeEntity> types = [];
    for (PokemonTypeModelDTO item in data.types!) {
      types.add(
        PokemonTypeEntity(
          type: pokemonSpeciesModelToEntity(
            item.type ?? PokemonSpeciesModelDTo(),
          ),
        ),
      );
    }
    return types;
  }

  PokemonSpeciesEntity pokemonSpeciesModelToEntity(PokemonSpeciesModelDTo data) => PokemonSpeciesEntity(
        name: data.name ?? "-",
      );
}
