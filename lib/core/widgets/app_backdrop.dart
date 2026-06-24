import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppBackdrop extends StatelessWidget {
  const AppBackdrop({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.backgroundDeep,
                  AppColors.background,
                  AppColors.surface,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -70,
          left: -30,
          child: _Orb(
            size: 220,
            color: AppColors.primaryBright.withValues(alpha: 0.18),
          ),
        ),
        Positioned(
          top: 220,
          right: -50,
          child: _Orb(size: 180, color: AppColors.info.withValues(alpha: 0.1)),
        ),
        Positioned(
          bottom: -70,
          left: 20,
          child: _Orb(size: 220, color: AppColors.teal.withValues(alpha: 0.08)),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
        ),
      ),
    );
  }
}
