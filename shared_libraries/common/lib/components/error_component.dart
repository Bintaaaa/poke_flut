import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String? url;
  final String? message;
  const ErrorComponent({
    super.key,
    this.url,
    this.message,
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
              url ?? "https://www.svgrepo.com/show/207530/warning-attention.svg",
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            message ?? "Tuliskan Nama Lengkap Charactermu dengan Benar",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
