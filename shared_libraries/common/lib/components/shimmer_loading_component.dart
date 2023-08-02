import 'package:dependencies/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingComponent extends StatelessWidget {
  const ShimmerLoadingComponent({
    this.height,
    this.marginHorizontal,
    this.marginVertical,
    this.width,
    this.radius,
    super.key,
  });

  final double? height;
  final double? width;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: width ?? double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal ?? 16.0,
        vertical: marginVertical ?? 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? 18.0,
          ),
        ),
        child: Shimmer.fromColors(
          baseColor: const Color(
            0xffF0EDED,
          ),
          highlightColor: const Color.fromARGB(
            255,
            221,
            220,
            220,
          ),
          direction: ShimmerDirection.ltr,
          child: Container(
            width: 120,
            height: 100,
            color: const Color.fromARGB(
              255,
              221,
              200,
              190,
            ),
          ),
        ),
      ),
    );
  }
}
