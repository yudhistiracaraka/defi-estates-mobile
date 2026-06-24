import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../properties/domain/app_models.dart';

class ContractInfo extends StatelessWidget {
  const ContractInfo({required this.contract, super.key});

  final ContractDeployment contract;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contract.name,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          contract.address,
          style: const TextStyle(color: AppColors.primaryPale),
        ),
        const SizedBox(height: 8),
        Text(
          contract.status.label,
          style: const TextStyle(color: AppColors.primarySoft),
        ),
        const SizedBox(height: 6),
        Text(
          'Deployed ${contract.date}',
          style: const TextStyle(color: AppColors.textMuted),
        ),
      ],
    );
  }
}
