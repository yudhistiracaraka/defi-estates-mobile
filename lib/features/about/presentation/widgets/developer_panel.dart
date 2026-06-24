import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_panel.dart';

class DeveloperPanel extends StatelessWidget {
  const DeveloperPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About the Developer',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'This mobile build showcases how the DeFi Estates concept can translate cleanly from a web assessment into a mobile-first investor experience with stronger architecture.',
            style: TextStyle(color: AppColors.textBody, height: 1.5),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.work_outline_rounded),
                  label: const Text('LinkedIn'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
