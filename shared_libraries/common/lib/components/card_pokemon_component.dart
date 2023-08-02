import 'package:common/components/chip_ability_component.dart';
import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CardPokemonComponent extends StatelessWidget {
  final String title;
  final List<String> ability;
  final String sourceSvg;
  const CardPokemonComponent({
    super.key,
    required this.title,
    required this.ability,
    required this.sourceSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: ability.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChipAbilityPokemon(
                        title: ability[index],
                      );
                    },
                  ),
                )
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
                SvgPicture.network(
                  sourceSvg,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
