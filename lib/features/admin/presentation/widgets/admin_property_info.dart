import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../properties/domain/app_models.dart';

class AdminPropertyInfo extends StatelessWidget {
  const AdminPropertyInfo({required this.property, super.key});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          property.title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          property.location,
          style: const TextStyle(color: AppColors.textMuted),
        ),
        const SizedBox(height: 6),
        Text(
          '${property.tokenPrice} ETH',
          style: const TextStyle(color: AppColors.primarySoft),
        ),
      ],
    );
  }
}
