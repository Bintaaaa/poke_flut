import 'package:common/extensions/get_id_extension.dart';
import 'package:pokemons/data/model/pokemond_model_dto.dart';
import 'package:pokemons/domains/entities/pokemons_entities.dart';

class PokemonsMappers {
  List<PokemonEntity> pokemonsModelToEntity(PokemonModelDTO data) {
    List<PokemonEntity> pokemons = [];
    for (PokemonResultDTO item in data.results!) {
      pokemons.add(
        PokemonEntity(
          name: item.name ?? "-",
          id: (item.url ?? "1").convertToId,
        ),
      );
    }
    return pokemons;
  }
}
