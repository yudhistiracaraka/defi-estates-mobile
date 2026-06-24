import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/animated_reveal.dart';
import '../../../core/widgets/app_backdrop.dart';
import '../../../features/browse/presentation/browse_screen.dart';
import '../../../features/wallet/application/wallet_controller.dart';
import '../../../features/wallet/presentation/widgets/connect_wallet_sheet.dart';
import 'widgets/drawer_tile.dart';

class AppShell extends ConsumerWidget {
  const AppShell({required this.currentIndex, required this.child, super.key});

  final int currentIndex;
  final Widget child;

  static const _routes = [
    AppRoutes.home,
    AppRoutes.browse,
    AppRoutes.user,
    AppRoutes.about,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletControllerProvider);
    final showAppBarSubtitle = context.screenWidth >= 390;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primaryDeep,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.apartment_rounded,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DeFi Estates',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  if (showAppBarSubtitle)
                    const Text(
                      'Mobile investor app',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: wallet.isConnected
                ? TextButton.icon(
                    onPressed: () => ref
                        .read(walletControllerProvider.notifier)
                        .disconnect(),
                    icon: const Icon(Icons.power_settings_new_rounded),
                    label: Text(AppFormatters.compactWallet(wallet.address)),
                  )
                : TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.background,
                        builder: (_) => const ConnectWalletSheet(),
                      );
                    },
                    icon: const Icon(Icons.account_balance_wallet_outlined),
                    label: const Text('Connect'),
                  ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.surfaceDeep),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'DeFi Estates',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    wallet.isConnected
                        ? AppFormatters.compactWallet(wallet.address)
                        : 'Wallet disconnected',
                    style: const TextStyle(color: AppColors.primaryPale),
                  ),
                ],
              ),
            ),
            DrawerTile(
              icon: Icons.home_outlined,
              label: 'Home',
              onTap: () => _go(context, AppRoutes.home),
            ),
            DrawerTile(
              icon: Icons.search_rounded,
              label: 'Browse',
              onTap: () => _go(context, AppRoutes.browse),
            ),
            DrawerTile(
              icon: Icons.info_outline_rounded,
              label: 'About',
              onTap: () => _go(context, AppRoutes.about),
            ),
            DrawerTile(
              icon: Icons.dashboard_outlined,
              label: 'User Dashboard',
              onTap: () => _go(context, AppRoutes.user),
            ),
            if (wallet.isAdmin)
              DrawerTile(
                icon: Icons.admin_panel_settings_outlined,
                label: 'Admin Dashboard',
                onTap: () => _go(context, AppRoutes.admin),
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: AppBackdrop(
          child: AdaptivePage(child: AnimatedReveal(child: child)),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => _go(context, _routes[index]),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.travel_explore_outlined),
            selectedIcon: Icon(Icons.travel_explore_rounded),
            label: 'Browse',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Portfolio',
          ),
          NavigationDestination(
            icon: Icon(Icons.layers_outlined),
            selectedIcon: Icon(Icons.layers_rounded),
            label: 'About',
          ),
        ],
      ),
      floatingActionButton: wallet.isAdmin
          ? FloatingActionButton.extended(
              onPressed: () => _go(context, AppRoutes.admin),
              backgroundColor: AppColors.primaryBright,
              label: const Text('Admin'),
              icon: const Icon(Icons.shield_outlined),
            )
          : null,
    );
  }

  void _go(BuildContext context, String route) {
    Navigator.popUntil(context, (routeItem) => routeItem.isFirst);
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }
}

class AppShellBrowseBody extends StatelessWidget {
  const AppShellBrowseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrowseScreen();
  }
}
