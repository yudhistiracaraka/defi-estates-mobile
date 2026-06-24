import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../application/wallet_controller.dart';

class ConnectWalletSheet extends ConsumerWidget {
  const ConnectWalletSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const Text(
              'Connect Wallet',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose a demo identity so we can unlock the investor or admin experience in the mobile app.',
              style: TextStyle(color: AppColors.textMuted, height: 1.5),
            ),
            const SizedBox(height: 18),
            AppPanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Investor Wallet',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Access browsing, property details, portfolio, and transaction history.',
                    style: TextStyle(color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 14),
                  FilledButton(
                    onPressed: () {
                      ref
                          .read(walletControllerProvider.notifier)
                          .connectInvestor();
                      Navigator.pop(context);
                    },
                    child: const Text('Connect as Investor'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            AppPanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Admin Wallet',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Unlock the admin dashboard for properties, contracts, and platform metrics.',
                    style: TextStyle(color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 14),
                  OutlinedButton(
                    onPressed: () {
                      ref
                          .read(walletControllerProvider.notifier)
                          .connectAdmin();
                      Navigator.pop(context);
                    },
                    child: const Text('Connect as Admin'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
