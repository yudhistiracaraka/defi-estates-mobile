import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RemoteImage extends StatelessWidget {
  const RemoteImage({
    required this.imageUrl,
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        height: height,
        width: width,
        color: AppColors.surfaceAlt,
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_outlined,
          color: AppColors.textMuted,
          size: 36,
        ),
      ),
    );

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}
