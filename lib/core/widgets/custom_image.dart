import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.asset,
    this.height,
    this.color,
    this.width,

    this.fit = BoxFit.contain,
  });
  final String asset;
  final double? height;

  final Color? color;
  final double? width;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      color: color,
      asset,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
