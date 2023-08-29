import 'package:dependencies/equatable/equatable.dart';

class PokemonModelDTO extends Equatable {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<PokemonResultDTO>? results;

  const PokemonModelDTO({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonModelDTO.fromJson(Map<String, dynamic> json) =>
      PokemonModelDTO(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonResultDTO>.from(
          json["results"].map(
            (x) => PokemonResultDTO.fromJson(
              x,
            ),
          ),
        ),
      );

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}

class PokemonResultDTO extends Equatable {
  final String? name;
  final String? url;

  const PokemonResultDTO({
    this.name,
    this.url,
  });

  factory PokemonResultDTO.fromJson(Map<String, dynamic> json) =>
      PokemonResultDTO(
        name: json["name"],
        url: json["url"],
      );

  @override
  List<Object?> get props => [name, url];
}
