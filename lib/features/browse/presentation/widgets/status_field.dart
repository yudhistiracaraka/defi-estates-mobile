import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../properties/domain/app_models.dart';
import '../../application/browse_controller.dart';

class StatusField extends StatelessWidget {
  const StatusField({required this.filters, required this.ref, super.key});

  final BrowseFilters filters;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<PropertyStatus?>(
      value: filters.status,
      decoration: const InputDecoration(labelText: 'Status'),
      items: const [
        DropdownMenuItem<PropertyStatus?>(
          value: null,
          child: Text('All Statuses'),
        ),
        DropdownMenuItem<PropertyStatus?>(
          value: PropertyStatus.available,
          child: Text('Available'),
        ),
        DropdownMenuItem<PropertyStatus?>(
          value: PropertyStatus.soldOut,
          child: Text('Sold Out'),
        ),
        DropdownMenuItem<PropertyStatus?>(
          value: PropertyStatus.comingSoon,
          child: Text('Coming Soon'),
        ),
      ],
      onChanged: ref.read(browseControllerProvider.notifier).updateStatus,
    );
  }
}
