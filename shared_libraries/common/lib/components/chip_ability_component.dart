import 'package:flutter/material.dart';

class ChipAbilityPokemon extends StatelessWidget {
  final String title;
  const ChipAbilityPokemon({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        8.0,
      ),
      margin: const EdgeInsets.only(
        right: 8.0,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green[700],
        borderRadius: BorderRadius.circular(
          18.0,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
