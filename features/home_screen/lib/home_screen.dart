import 'package:common/components/card_pokemon_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CardPokemonComponent(
                title: "#1\nPokemon Go",
                ability: const ["Terbang", "Melayang"],
                sourceSvg:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
              );
            },
          ),
        ),
      ),
    );
  }
}
