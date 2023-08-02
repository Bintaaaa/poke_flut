import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: SvgPicture.network(
              "https://www.svgrepo.com/show/207530/warning-attention.svg",
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Maaf Data Sedang Tidak Tersedia",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
