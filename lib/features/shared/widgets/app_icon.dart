import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppIcon({
    required this.assetName,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  factory AppIcon.emailSent({
    double? size,
  }) =>
      AppIcon(
        assetName: 'email_sent.svg',
        width: size,
        height: size,
      );

  @override
  Widget build(BuildContext context) {
    final key = ValueKey('AppIcon-$assetName');

    final imagePath = assetName.endsWith('.svg')
        ? 'assets/svgs/$assetName'
        : 'assets/pngs/$assetName';

    if (assetName.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        key: key,
        width: width,
        height: height,
        fit: fit,
      );
    }

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      key: key,
      fit: fit,
    );
  }
}
