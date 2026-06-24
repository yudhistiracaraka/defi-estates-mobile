import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/section_header.dart';
import '../../app/application/app_providers.dart';
import '../../properties/presentation/widgets/property_card.dart';
import '../application/browse_controller.dart';
import 'widgets/location_field.dart';
import 'widgets/max_price_field.dart';
import 'widgets/min_price_field.dart';
import 'widgets/status_field.dart';

class BrowseScreen extends ConsumerWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProperties = ref.watch(filteredPropertiesProvider);
    final filters = ref.watch(browseControllerProvider);
    final locations = ref.watch(browseLocationsProvider);
    final horizontalPadding = context.horizontalPagePadding;
    final useWideLayout = context.useWideLayout;

    return ListView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 8, horizontalPadding, 28),
      children: [
        const SectionHeader(
          title: 'Browse Properties',
          subtitle:
              'Explore our curated selection of tokenized real estate investments.',
        ),
        const SizedBox(height: 18),
        TextField(
          onChanged: ref.read(browseControllerProvider.notifier).updateQuery,
          decoration: const InputDecoration(
            hintText: 'Search by property name or location...',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 14),
        AppPanel(
          child: Column(
            children: [
              if (useWideLayout)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LocationField(
                        filters: filters,
                        locations: locations,
                        ref: ref,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatusField(filters: filters, ref: ref),
                    ),
                  ],
                )
              else ...[
                LocationField(filters: filters, locations: locations, ref: ref),
                const SizedBox(height: 12),
                StatusField(filters: filters, ref: ref),
              ],
              const SizedBox(height: 12),
              if (useWideLayout)
                Row(
                  children: [
                    Expanded(child: MinPriceField(ref: ref)),
                    const SizedBox(width: 12),
                    Expanded(child: MaxPriceField(ref: ref)),
                  ],
                )
              else
                Column(
                  children: [
                    MinPriceField(ref: ref),
                    const SizedBox(height: 12),
                    MaxPriceField(ref: ref),
                  ],
                ),
              if (!useWideLayout) ...[
                const SizedBox(height: 14),
              ] else ...[
                const SizedBox(height: 16),
              ],
              Align(
                alignment: useWideLayout
                    ? Alignment.centerRight
                    : Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: useWideLayout ? 180 : double.infinity,
                  ),
                  child: OutlinedButton(
                    onPressed: ref
                        .read(browseControllerProvider.notifier)
                        .reset,
                    child: const Text('Reset Filters'),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        SectionHeader(
          title: 'Results',
          subtitle:
              '${filteredProperties.length} properties match your filters.',
          action: TextButton(
            onPressed: () {
              final count = ref.read(propertiesProvider).length;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Showing $count total properties')),
              );
            },
            child: const Text('Summary'),
          ),
        ),
        const SizedBox(height: 16),
        if (filteredProperties.isEmpty)
          const AppPanel(
            child: Column(
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 40,
                  color: AppColors.primarySoft,
                ),
                SizedBox(height: 12),
                Text(
                  'No properties found',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Try adjusting your search criteria.',
                  style: TextStyle(color: AppColors.textMuted),
                ),
              ],
            ),
          )
        else
          ...filteredProperties.map(
            (property) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PropertyCard(property: property),
            ),
          ),
      ],
    );
  }
}
