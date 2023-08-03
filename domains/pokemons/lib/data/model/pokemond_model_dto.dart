class PokemonModelDTO {
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
}

class PokemonResultDTO {
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
}
