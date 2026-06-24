import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/animated_reveal.dart';
import '../../../core/widgets/app_panel.dart';
import '../../../core/widgets/remote_image.dart';
import '../../wallet/application/wallet_controller.dart';
import '../domain/app_models.dart';
import 'widgets/metric_row.dart';
import 'widgets/purchase_sheet.dart';

class PropertyDetailScreen extends ConsumerWidget {
  const PropertyDetailScreen({required this.property, super.key});

  final Property property;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletControllerProvider);
    final horizontalPadding = context.horizontalPagePadding;
    final expandedHeight = context.useWideLayout ? 360.0 : 280.0;
    final statusColor = switch (property.status) {
      PropertyStatus.available => AppColors.success,
      PropertyStatus.soldOut => AppColors.danger,
      PropertyStatus.comingSoon => AppColors.warning,
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: expandedHeight,
            pinned: true,
            backgroundColor: AppColors.background,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'property-image-${property.id}',
                    child: RemoteImage(
                      imageUrl: property.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.black.withValues(alpha: 0.18),
                          AppColors.black.withValues(alpha: 0.72),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              16,
              horizontalPadding,
              28,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                AnimatedReveal(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          property.title,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          property.status.label,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedReveal(
                  delay: const Duration(milliseconds: 60),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        property.location,
                        style: const TextStyle(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                AnimatedReveal(
                  delay: const Duration(milliseconds: 100),
                  child: AppPanel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MetricRow(
                          label: 'Property Price',
                          value: AppFormatters.usd(property.price),
                        ),
                        const SizedBox(height: 10),
                        MetricRow(
                          label: 'Token Price',
                          value:
                              '${AppFormatters.eth(property.tokenPrice)} ETH',
                        ),
                        const SizedBox(height: 10),
                        MetricRow(
                          label: 'Expected Return',
                          value: '${property.returnRate}% / year',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Funding Progress',
                              style: TextStyle(color: AppColors.textMuted),
                            ),
                            Text(
                              '${property.tokensSold}/${property.totalTokens} tokens',
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: LinearProgressIndicator(
                            value: property.fundingProgress,
                            minHeight: 8,
                            backgroundColor: AppColors.border,
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const AnimatedReveal(
                  delay: Duration(milliseconds: 150),
                  child: Text(
                    'About this property',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedReveal(
                  delay: const Duration(milliseconds: 180),
                  child: Text(
                    property.description,
                    style: const TextStyle(
                      color: AppColors.textBody,
                      height: 1.55,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Features',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: property.features
                      .map(
                        (feature) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceAlt,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            feature,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Documents',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                ...property.documents.map(
                  (document) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AppPanel(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.description_outlined,
                            color: AppColors.primarySoft,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              document.name,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textMuted,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (property.contractAddress != null) ...[
                  const SizedBox(height: 8),
                  AppPanel(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Smart Contract',
                          style: TextStyle(color: AppColors.textMuted),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          property.contractAddress!,
                          style: const TextStyle(
                            color: AppColors.primaryPale,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                FilledButton(
                  onPressed:
                      wallet.isConnected &&
                          property.status == PropertyStatus.available
                      ? () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppColors.background,
                            builder: (_) => PurchaseSheet(property: property),
                          );
                        }
                      : null,
                  child: Text(
                    !wallet.isConnected
                        ? 'Connect Wallet to Buy'
                        : property.status == PropertyStatus.available
                        ? 'Buy Tokens'
                        : property.status.label,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
