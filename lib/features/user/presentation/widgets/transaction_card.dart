import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../properties/domain/app_models.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.transaction,
    required this.useWideLayout,
    super.key,
  });

  final TransactionRecord transaction;
  final bool useWideLayout;

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      child: useWideLayout
          ? Row(
              children: [
                _TransactionBadge(type: transaction.type),
                const SizedBox(width: 12),
                Expanded(child: _TransactionText(transaction: transaction)),
                _ValueText(value: transaction.value),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _TransactionBadge(type: transaction.type),
                    const SizedBox(width: 12),
                    Expanded(child: _TransactionText(transaction: transaction)),
                  ],
                ),
                const SizedBox(height: 10),
                _ValueText(value: transaction.value),
              ],
            ),
    );
  }
}

class _TransactionBadge extends StatelessWidget {
  const _TransactionBadge({required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: type == TransactionType.purchase
            ? AppColors.primaryDeep
            : AppColors.successDeep,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        type == TransactionType.purchase
            ? Icons.shopping_bag_outlined
            : Icons.attach_money_rounded,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _TransactionText extends StatelessWidget {
  const _TransactionText({required this.transaction});

  final TransactionRecord transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transaction.property,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${transaction.type.label} • ${transaction.date}',
          style: const TextStyle(color: AppColors.textMuted),
        ),
      ],
    );
  }
}

class _ValueText extends StatelessWidget {
  const _ValueText({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value ETH',
      style: const TextStyle(
        color: AppColors.primarySoft,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
