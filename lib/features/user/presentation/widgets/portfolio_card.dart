import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../properties/domain/app_models.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    required this.position,
    required this.useWideLayout,
    required this.onPressed,
    super.key,
  });

  final PortfolioPosition position;
  final bool useWideLayout;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      child: useWideLayout
          ? Row(
              children: [
                Expanded(child: _PortfolioText(position: position)),
                const SizedBox(width: 16),
                _PortfolioAction(
                  value: position.investmentValue,
                  onPressed: onPressed,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PortfolioText(position: position),
                const SizedBox(height: 12),
                _PortfolioAction(
                  value: position.investmentValue,
                  onPressed: onPressed,
                ),
              ],
            ),
    );
  }
}

class _PortfolioText extends StatelessWidget {
  const _PortfolioText({required this.position});

  final PortfolioPosition position;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          position.propertyName,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${position.tokensOwned} tokens owned',
          style: const TextStyle(color: AppColors.textMuted),
        ),
      ],
    );
  }
}

class _PortfolioAction extends StatelessWidget {
  const _PortfolioAction({required this.value, required this.onPressed});

  final double value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$value ETH',
          style: const TextStyle(
            color: AppColors.primarySoft,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton(onPressed: onPressed, child: const Text('View')),
      ],
    );
  }
}
