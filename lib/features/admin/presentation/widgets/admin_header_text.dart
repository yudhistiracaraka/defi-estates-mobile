import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AdminHeaderText extends StatelessWidget {
  const AdminHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Admin Dashboard',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Manage properties, contracts, and platform settings.',
          style: TextStyle(color: AppColors.textMuted),
        ),
      ],
    );
  }
}
