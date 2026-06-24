import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../wallet/application/wallet_controller.dart';
import '../../domain/app_models.dart';

class PurchaseSheet extends ConsumerStatefulWidget {
  const PurchaseSheet({required this.property, super.key});

  final Property property;

  @override
  ConsumerState<PurchaseSheet> createState() => _PurchaseSheetState();
}

class _PurchaseSheetState extends ConsumerState<PurchaseSheet> {
  int tokenAmount = 1;
  String status = 'initial';

  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(walletControllerProvider);
    final total = widget.property.tokenPrice * tokenAmount + 0.0012;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderMuted,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              status == 'success'
                  ? 'Transaction Complete'
                  : status == 'error'
                  ? 'Transaction Failed'
                  : 'Purchase Property Tokens',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            if (!wallet.isConnected)
              const Text(
                'Connect a wallet from the top app bar before purchasing tokens.',
                style: TextStyle(color: AppColors.textMuted),
              )
            else if (status == 'success')
              Text(
                'You successfully purchased $tokenAmount tokens of ${widget.property.title}.',
                style: const TextStyle(color: AppColors.textMuted),
              )
            else if (status == 'error')
              const Text(
                'The demo transaction failed. Try again to simulate a successful purchase.',
                style: TextStyle(color: AppColors.textMuted),
              )
            else
              Text(
                'Property: ${widget.property.title}',
                style: const TextStyle(color: AppColors.textMuted),
              ),
            const SizedBox(height: 18),
            if (status == 'initial') ...[
              AppPanel(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Token Price'),
                        Text(
                          '${AppFormatters.eth(widget.property.tokenPrice)} ETH',
                          style: const TextStyle(color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          onPressed: tokenAmount > 1
                              ? () => setState(() => tokenAmount--)
                              : null,
                          icon: const Icon(Icons.remove),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '$tokenAmount token${tokenAmount > 1 ? 's' : ''}',
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        IconButton.filledTonal(
                          onPressed: () => setState(() => tokenAmount++),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppPanel(
                child: Column(
                  children: [
                    _SummaryRow(
                      label: 'Subtotal',
                      value:
                          '${AppFormatters.eth(widget.property.tokenPrice * tokenAmount)} ETH',
                    ),
                    const SizedBox(height: 8),
                    const _SummaryRow(
                      label: 'Gas Fee (est.)',
                      value: '0.0012 ETH',
                    ),
                    const Divider(height: 24),
                    _SummaryRow(
                      label: 'Total',
                      value: '${AppFormatters.eth(total)} ETH',
                      emphasize: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed:
                    wallet.isConnected &&
                        widget.property.status == PropertyStatus.available
                    ? _completeTransaction
                    : null,
                child: Text(
                  !wallet.isConnected
                      ? 'Connect Wallet to Buy'
                      : widget.property.status == PropertyStatus.available
                      ? 'Confirm Purchase'
                      : widget.property.status.label,
                ),
              ),
            ] else ...[
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  status == 'success' ? 'View My Portfolio' : 'Close',
                ),
              ),
              if (status == 'error') ...[
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => setState(() => status = 'initial'),
                  child: const Text('Try Again'),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  void _completeTransaction() {
    final success = Random().nextDouble() > 0.1;
    setState(() => status = success ? 'success' : 'error');
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final color = emphasize ? AppColors.primarySoft : AppColors.textPrimary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textMuted)),
        Text(
          value,
          style: TextStyle(color: color, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
