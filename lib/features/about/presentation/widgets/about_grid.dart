import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_panel.dart';

class AboutGrid extends StatelessWidget {
  const AboutGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      (
        Icons.layers_outlined,
        'Property Tokenization',
        'Real estate assets are divided into digital tokens that represent fractional ownership.',
      ),
      (
        Icons.shield_outlined,
        'Smart Contracts',
        'Ownership rights and transactions are secured with blockchain-based logic.',
      ),
      (
        Icons.widgets_outlined,
        'Fractional Ownership',
        'Invest in high-value properties with as little as one token.',
      ),
      (
        Icons.autorenew_rounded,
        'Automated Returns',
        'Rental income and appreciation can be distributed directly to token holders.',
      ),
    ];

    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppPanel(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceDeep,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(item.$1, color: AppColors.primarySoft),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.$2,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.$3,
                            style: const TextStyle(
                              color: AppColors.textSoft,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
