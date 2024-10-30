import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CardPokemonComponent extends StatefulWidget {
  final int pokemonId;
  final String title;
  final String sourceSvg;
  final Function() onTap;
  const CardPokemonComponent({
    super.key,
    required this.title,
    required this.sourceSvg,
    required this.pokemonId,
    required this.onTap,
  });

  @override
  State<CardPokemonComponent> createState() => _CardPokemonComponentState();
}

class _CardPokemonComponentState extends State<CardPokemonComponent> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 130.0,
        padding: const EdgeInsets.all(
          16.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.green[400],
          borderRadius: BorderRadius.circular(
            18.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(
                        300.0,
                      ),
                    ),
                  ),
                  Hero(
                    tag: widget.sourceSvg,
                    child: SvgPicture.network(
                      widget.sourceSvg,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
