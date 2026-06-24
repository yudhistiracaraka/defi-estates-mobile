import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  bool get isSmallPhone => screenWidth < 360;

  bool get isTablet => screenWidth >= 768;

  bool get isLargeTablet => screenWidth >= 1024;

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  bool get useWideLayout => isTablet || (isLandscape && screenWidth >= 720);

  double get horizontalPagePadding {
    if (isLargeTablet) return 32;
    if (isTablet) return 28;
    if (screenWidth >= 430) return 24;
    return 20;
  }

  double get maxContentWidth {
    if (isLargeTablet) return 1100;
    if (isTablet) return 920;
    return 680;
  }
}

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: context.maxContentWidth),
        child: child,
      ),
    );
  }
}
