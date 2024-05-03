import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage({
    required this.assetName,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  factory AppImage.businessOwner({
    double? size,
  }) =>
      AppImage(
        assetName: 'business_owner.png',
        width: size,
        height: size,
      );

  factory AppImage.logoText({
    double? size,
  }) =>
      AppImage(
        assetName: 'logo_text.svg',
        width: size,
        height: size,
      );

  factory AppImage.verifyEmailBackground({
    double? size,
  }) =>
      AppImage(
        assetName: 'verify_email_background.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
      );

  factory AppImage.vynnBanner({
    double? size,
  }) =>
      AppImage(
        assetName: 'vynn_banner.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
      );

  factory AppImage.cycle({
    double? size,
  }) =>
      AppImage(
        assetName: 'cycle.svg',
        width: size,
        height: size,
        fit: BoxFit.contain,
      );

  factory AppImage.bottomTitle({
    double? size,
  }) =>
      AppImage(
        assetName: 'bottom_title.svg',
        width: size,
        height: size,
        fit: BoxFit.contain,
      );

  factory AppImage.swipe({
    double? size,
  }) =>
      AppImage(
        assetName: 'swipe.svg',
        width: size,
        height: size,
        fit: BoxFit.contain,
      );

  @override
  Widget build(BuildContext context) {
    final key = ValueKey('AppImage-$assetName');

    final imagePath = assetName.endsWith('.svg')
        ? 'assets/svgs/$assetName'
        : 'assets/pngs/$assetName';

    if (assetName.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        key: key,
        width: width,
        height: height,
        // fit: fit,
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
