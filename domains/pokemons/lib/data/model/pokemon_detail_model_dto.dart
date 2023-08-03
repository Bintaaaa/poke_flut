class PokemonDetailModelDTO {
  final List<Ability>? abilities;
  final int? baseExperience;
  final List<PokemonSpeciesModelDTo>? forms;
  final List<GameIndex>? gameIndices;
  final int? height;
  final List<dynamic>? heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  final List<dynamic>? pastTypes;
  final PokemonSpeciesModelDTo? species;
  final Sprites? sprites;
  final List<PokemonStatisticModelDTO>? stats;
  final List<PokemonTypeModelDTO>? types;
  final int? weight;

  PokemonDetailModelDTO({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonDetailModelDTO.fromJson(Map<String, dynamic> json) =>
      PokemonDetailModelDTO(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: List<PokemonSpeciesModelDTo>.from(
          json["forms"].map(
            (x) => PokemonSpeciesModelDTo.fromJson(x),
          ),
        ),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: PokemonSpeciesModelDTo.fromJson(
          json["species"],
        ),
        stats: List<PokemonStatisticModelDTO>.from(
          json["stats"].map(
            (x) => PokemonStatisticModelDTO.fromJson(x),
          ),
        ),
        types: List<PokemonTypeModelDTO>.from(
          json["types"].map(
            (x) => PokemonTypeModelDTO.fromJson(x),
          ),
        ),
        weight: json["weight"],
      );
}

class Ability {
  final PokemonSpeciesModelDTo? ability;
  final bool? isHidden;
  final int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: json["ability"] == null
            ? null
            : PokemonSpeciesModelDTo.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}

class PokemonSpeciesModelDTo {
  final String? name;
  final String? url;

  PokemonSpeciesModelDTo({
    this.name,
    this.url,
  });

  factory PokemonSpeciesModelDTo.fromJson(Map<String, dynamic> json) =>
      PokemonSpeciesModelDTo(
        name: json["name"],
        url: json["url"],
      );
}

class GameIndex {
  final int? gameIndex;
  final PokemonSpeciesModelDTo? version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: json["version"] == null
            ? null
            : PokemonSpeciesModelDTo.fromJson(json["version"]),
      );
}

class Move {
  final PokemonSpeciesModelDTo? move;
  final List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json["move"] == null
            ? null
            : PokemonSpeciesModelDTo.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
          json["version_group_details"].map(
            (x) => VersionGroupDetail.fromJson(x),
          ),
        ),
      );
}

class VersionGroupDetail {
  final int? levelLearnedAt;
  final PokemonSpeciesModelDTo? moveLearnMethod;
  final PokemonSpeciesModelDTo? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: json["move_learn_method"] == null
            ? null
            : PokemonSpeciesModelDTo.fromJson(json["move_learn_method"]),
        versionGroup: json["version_group"] == null
            ? null
            : PokemonSpeciesModelDTo.fromJson(json["version_group"]),
      );
}

class GenerationV {
  final Sprites? blackWhite;

  GenerationV({
    this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null
            ? null
            : Sprites.fromJson(json["black-white"]),
      );
}

class GenerationIv {
  final Sprites? diamondPearl;
  final Sprites? platinum;

  GenerationIv({
    this.diamondPearl,
    this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        platinum: Sprites.fromJson(json["platinum"]),
      );
}

class Versions {
  final GenerationI? generationI;
  final GenerationIi? generationIi;
  final GenerationIii? generationIii;
  final GenerationIv? generationIv;
  final GenerationV? generationV;
  final Map<String, Home>? generationVi;
  final GenerationVii? generationVii;
  final GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );
}

class Sprites {
  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        versions: Versions.fromJson(json["versions"]),
        animated: Sprites.fromJson(json["animated"]),
      );
}

class GenerationI {
  final RedBlue? redBlue;
  final RedBlue? yellow;

  GenerationI({
    this.redBlue,
    this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow:
            json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
      );
}

class RedBlue {
  final String? backDefault;
  final String? backGray;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontGray;
  final String? frontTransparent;

  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );
}

class GenerationIi {
  final Crystal? crystal;
  final Gold? gold;
  final Gold? silver;

  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Gold.fromJson(json["gold"]),
        silver: Gold.fromJson(json["silver"]),
      );
}

class Crystal {
  final String? backDefault;
  final String? backShiny;
  final String? backShinyTransparent;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontShinyTransparent;
  final String? frontTransparent;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );
}

class Gold {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontTransparent;

  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );
}

class GenerationIii {
  final OfficialArtwork? emerald;
  final Gold? fireredLeafgreen;
  final Gold? rubySapphire;

  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
      );
}

class OfficialArtwork {
  final String? frontDefault;
  final String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );
}

class Home {
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
}

class GenerationVii {
  final DreamWorld? icons;
  final Home? ultraSunUltraMoon;

  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
      );
}

class DreamWorld {
  final String? frontDefault;
  final dynamic frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );
}

class GenerationViii {
  final DreamWorld? icons;

  GenerationViii({
    this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
      );
}

class Other {
  final DreamWorld? dreamWorld;
  final Home? home;
  final OfficialArtwork? officialArtwork;

  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null
            ? null
            : DreamWorld.fromJson(json["dream_world"]),
        home: json["home"] == null
            ? null
            : Home.fromJson(
                json["home"],
              ),
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtwork.fromJson(
                json["official-artwork"],
              ),
      );
}

class PokemonStatisticModelDTO {
  final int? baseStat;
  final int? effort;
  final PokemonSpeciesModelDTo? stat;

  PokemonStatisticModelDTO({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory PokemonStatisticModelDTO.fromJson(Map<String, dynamic> json) =>
      PokemonStatisticModelDTO(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: PokemonSpeciesModelDTo.fromJson(
          json["stat"],
        ),
      );
}

class PokemonTypeModelDTO {
  final int? slot;
  final PokemonSpeciesModelDTo? type;

  PokemonTypeModelDTO({
    this.slot,
    this.type,
  });

  factory PokemonTypeModelDTO.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModelDTO(
        slot: json["slot"],
        type: PokemonSpeciesModelDTo.fromJson(json["type"]),
      );
}
