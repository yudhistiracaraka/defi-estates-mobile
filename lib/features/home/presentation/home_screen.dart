import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/animated_reveal.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/remote_image.dart';
import '../../../../core/widgets/section_header.dart';
import '../../app/application/app_providers.dart';
import '../../properties/presentation/widgets/property_card.dart';
import 'widgets/info_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredProperties = ref.watch(featuredPropertiesProvider);
    final theme = Theme.of(context);
    final horizontalPadding = context.horizontalPagePadding;
    final heroSpacer = context.isSmallPhone
        ? 72.0
        : context.useWideLayout
        ? 88.0
        : 110.0;

    return ListView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 8, horizontalPadding, 28),
      children: [
        AnimatedReveal(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              children: [
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.surfaceAlt, AppColors.background],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      AppColors.black.withValues(alpha: 0.35),
                      BlendMode.darken,
                    ),
                    child: const RemoteImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1560518883-ce09059eeffa?auto=format&fit=crop&w=1473&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.18),
                          ),
                        ),
                        child: const Text(
                          'Blockchain-backed investing',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: heroSpacer),
                      Text(
                        'Invest in Real Estate with Blockchain Technology',
                        style: theme.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Own fractions of premium properties with transparency, liquidity, and security built into the experience.',
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 22),
                      FilledButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.browse,
                        ),
                        child: const Text('Explore Properties'),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.about,
                        ),
                        child: const Text('How It Works'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        SectionHeader(
          title: 'Featured Properties',
          subtitle: 'A curated snapshot of premium tokenized opportunities.',
          action: TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.browse),
            child: const Text('View all'),
          ),
        ),
        const SizedBox(height: 16),
        ...featuredProperties.asMap().entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AnimatedReveal(
              delay: Duration(milliseconds: 80 * (entry.key + 1)),
              child: PropertyCard(property: entry.value),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const SectionHeader(
          title: 'How It Works',
          subtitle:
              'DeFi Estates makes real estate investment accessible and transparent through blockchain.',
        ),
        const SizedBox(height: 16),
        const AnimatedReveal(
          delay: Duration(milliseconds: 140),
          child: InfoCard(
            icon: Icons.domain_add_outlined,
            title: 'Property Tokenization',
            description:
                'Premium properties are selected, verified, and turned into smart-contract-backed digital ownership units.',
          ),
        ),
        const SizedBox(height: 12),
        const AnimatedReveal(
          delay: Duration(milliseconds: 200),
          child: InfoCard(
            icon: Icons.payments_outlined,
            title: 'Investment & Returns',
            description:
                'Buy property tokens using crypto and earn from rental income plus long-term appreciation.',
          ),
        ),
        const SizedBox(height: 12),
        const AnimatedReveal(
          delay: Duration(milliseconds: 260),
          child: InfoCard(
            icon: Icons.verified_user_outlined,
            title: 'Security & Transparency',
            description:
                'Transactions and ownership records stay visible and auditable on-chain.',
          ),
        ),
        const SizedBox(height: 20),
        AnimatedReveal(
          delay: const Duration(milliseconds: 320),
          child: AppPanel(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ready to Start Investing?',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Join thousands of investors already building their real estate portfolio with DeFi Estates.',
                  style: TextStyle(color: AppColors.textBody, height: 1.5),
                ),
                const SizedBox(height: 18),
                FilledButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.user),
                  child: const Text('Go to Dashboard'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
