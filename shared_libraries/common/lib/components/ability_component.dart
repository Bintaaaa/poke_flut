import 'package:flutter/material.dart';

class AbilityComponent extends StatelessWidget {
  const AbilityComponent({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 6.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
