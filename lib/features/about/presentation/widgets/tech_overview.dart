import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/section_header.dart';

class TechOverview extends StatelessWidget {
  const TechOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionHeader(
          title: 'Technical Overview',
          subtitle:
              'The mobile interpretation stays faithful to the core web product while adapting to a mobile-first experience.',
        ),
        SizedBox(height: 16),
        _TechPanel(
          title: 'Frontend Stack',
          icon: Icons.code_rounded,
          points: [
            'Flutter for cross-platform mobile delivery',
            'Riverpod for predictable app state',
            'Feature-first clean architecture structure',
            'Responsive widgets and reusable components',
          ],
        ),
        SizedBox(height: 12),
        _TechPanel(
          title: 'Blockchain Integration',
          icon: Icons.memory_rounded,
          points: [
            'Ethereum-style property token model',
            'Wallet-aware flows for investor and admin roles',
            'ERC-20 inspired property token concept',
            'Mocked smart-contract states for demo presentation',
          ],
        ),
      ],
    );
  }
}

class _TechPanel extends StatelessWidget {
  const _TechPanel({
    required this.title,
    required this.icon,
    required this.points,
  });

  final String title;
  final IconData icon;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primarySoft),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '• $point',
                style: const TextStyle(color: AppColors.textBody, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
