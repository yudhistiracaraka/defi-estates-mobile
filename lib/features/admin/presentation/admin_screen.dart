import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/common/access_state_card.dart';
import '../../../../core/widgets/common/app_stat_card.dart';
import '../../../../core/widgets/remote_image.dart';
import '../../app/application/app_providers.dart';
import '../../wallet/application/wallet_controller.dart';
import 'widgets/admin_actions.dart';
import 'widgets/admin_header_text.dart';
import 'widgets/admin_property_info.dart';
import 'widgets/contract_info.dart';

enum AdminDashboardTab { properties, contracts }

class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({super.key});

  @override
  ConsumerState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends ConsumerState<AdminScreen> {
  AdminDashboardTab selectedTab = AdminDashboardTab.properties;

  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(walletControllerProvider);
    final properties = ref.watch(propertiesProvider);
    final contracts = ref.watch(contractDeploymentsProvider);
    final horizontalPadding = context.horizontalPagePadding;
    final useWideLayout = context.useWideLayout;

    if (!wallet.isConnected || !wallet.isAdmin) {
      return AccessStateCard(
        icon: Icons.admin_panel_settings_outlined,
        title: 'Admin Access Required',
        description:
            'Connect using the admin wallet profile to access platform management tools.',
        buttonLabel: 'Back to Home',
        onPressed: () =>
            Navigator.pushReplacementNamed(context, AppRoutes.home),
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 8, horizontalPadding, 28),
      children: [
        if (useWideLayout)
          Row(
            children: [
              const Expanded(child: AdminHeaderText()),
              FilledButton.tonalIcon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ],
          )
        else
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [AdminHeaderText(), SizedBox(height: 12)],
          ),
        if (!useWideLayout)
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppStatCard(
              width: useWideLayout ? 220 : null,
              label: 'Total Properties',
              value: '${properties.length}',
              icon: Icons.apartment_rounded,
            ),
            AppStatCard(
              width: useWideLayout ? 220 : null,
              label: 'Active Contracts',
              value: '${contracts.length}',
              icon: Icons.token_rounded,
            ),
            AppStatCard(
              width: useWideLayout ? 220 : null,
              label: 'Total Sales',
              value: '5.67 ETH',
              icon: Icons.bar_chart_rounded,
            ),
          ],
        ),
        const SizedBox(height: 18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SegmentedButton<AdminDashboardTab>(
            segments: const [
              ButtonSegment(
                value: AdminDashboardTab.properties,
                label: Text('Properties'),
              ),
              ButtonSegment(
                value: AdminDashboardTab.contracts,
                label: Text('Contracts'),
              ),
            ],
            selected: {selectedTab},
            onSelectionChanged: (value) =>
                setState(() => selectedTab = value.first),
          ),
        ),
        const SizedBox(height: 18),
        if (selectedTab == AdminDashboardTab.properties)
          ...properties.map(
            (property) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppPanel(
                child: useWideLayout
                    ? Row(
                        children: [
                          RemoteImage(
                            imageUrl: property.imageUrl,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: AdminPropertyInfo(property: property),
                          ),
                          const SizedBox(width: 12),
                          const AdminActions(),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RemoteImage(
                                imageUrl: property.imageUrl,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AdminPropertyInfo(property: property),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: AdminActions(),
                          ),
                        ],
                      ),
              ),
            ),
          )
        else
          ...contracts.map(
            (contract) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppPanel(
                child: useWideLayout
                    ? Row(
                        children: [
                          Expanded(child: ContractInfo(contract: contract)),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Etherscan'),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContractInfo(contract: contract),
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Etherscan'),
                          ),
                        ],
                      ),
              ),
            ),
          ),
      ],
    );
  }
}
