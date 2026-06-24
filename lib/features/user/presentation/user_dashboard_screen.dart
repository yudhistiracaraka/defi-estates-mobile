import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/common/access_state_card.dart';
import '../../../../core/widgets/common/app_stat_card.dart';
import '../../app/application/app_providers.dart';
import '../../wallet/application/wallet_controller.dart';
import 'widgets/portfolio_card.dart';
import 'widgets/settings_section.dart';
import 'widgets/transaction_card.dart';

enum UserDashboardTab { portfolio, transactions, settings }

class UserDashboardScreen extends ConsumerStatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  ConsumerState<UserDashboardScreen> createState() =>
      _UserDashboardScreenState();
}

class _UserDashboardScreenState extends ConsumerState<UserDashboardScreen> {
  UserDashboardTab selectedTab = UserDashboardTab.portfolio;

  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(walletControllerProvider);
    final portfolio = ref.watch(portfolioProvider);
    final transactions = ref.watch(transactionsProvider);
    final repo = ref.watch(appRepositoryProvider);
    final horizontalPadding = context.horizontalPagePadding;
    final useWideLayout = context.useWideLayout;
    final List<Widget> tabContent = selectedTab == UserDashboardTab.portfolio
        ? portfolio.properties
              .map(
                (position) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PortfolioCard(
                    position: position,
                    useWideLayout: useWideLayout,
                    onPressed: () {
                      final property = repo.getPropertyById(
                        position.propertyId,
                      );
                      if (property != null) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.propertyDetail,
                          arguments: property,
                        );
                      }
                    },
                  ),
                ),
              )
              .toList()
        : selectedTab == UserDashboardTab.transactions
        ? transactions
              .map(
                (transaction) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TransactionCard(
                    transaction: transaction,
                    useWideLayout: useWideLayout,
                  ),
                ),
              )
              .toList()
        : [
            SettingsSection(
              walletLabel: AppFormatters.compactWallet(wallet.address),
              onDisconnect: () =>
                  ref.read(walletControllerProvider.notifier).disconnect(),
            ),
          ];

    if (!wallet.isConnected) {
      return AccessStateCard(
        icon: Icons.account_balance_wallet_outlined,
        title: 'Wallet Not Connected',
        description:
            'Please connect your wallet to access your dashboard and portfolio.',
        buttonLabel: 'Back to Home',
        onPressed: () =>
            Navigator.pushReplacementNamed(context, AppRoutes.home),
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 8, horizontalPadding, 28),
      children: [
        const Text(
          'My Dashboard',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppFormatters.compactWallet(wallet.address),
          style: const TextStyle(color: AppColors.textMuted),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppStatCard(
              width: useWideLayout ? 220 : null,
              label: 'Properties Owned',
              value: '${portfolio.totalProperties}',
              icon: Icons.apartment_rounded,
            ),
            AppStatCard(
              width: useWideLayout ? 220 : null,
              label: 'Total Invested',
              value: '${portfolio.totalInvested} ETH',
              icon: Icons.currency_bitcoin_rounded,
            ),
          ],
        ),
        const SizedBox(height: 12),
        AppStatCard(
          width: useWideLayout ? 220 : null,
          label: 'Last Transaction',
          value: '3 days ago',
          icon: Icons.history_rounded,
        ),
        const SizedBox(height: 18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SegmentedButton<UserDashboardTab>(
            segments: const [
              ButtonSegment(
                value: UserDashboardTab.portfolio,
                label: Text('Portfolio'),
              ),
              ButtonSegment(
                value: UserDashboardTab.transactions,
                label: Text('Transactions'),
              ),
              ButtonSegment(
                value: UserDashboardTab.settings,
                label: Text('Settings'),
              ),
            ],
            selected: {selectedTab},
            onSelectionChanged: (value) =>
                setState(() => selectedTab = value.first),
          ),
        ),
        const SizedBox(height: 18),
        ...tabContent,
      ],
    );
  }
}
