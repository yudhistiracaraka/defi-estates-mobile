import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/browse_controller.dart';

class LocationField extends StatelessWidget {
  const LocationField({
    required this.filters,
    required this.locations,
    required this.ref,
    super.key,
  });

  final BrowseFilters filters;
  final List<String> locations;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: filters.location,
      decoration: const InputDecoration(labelText: 'Location'),
      items: locations
          .map(
            (location) => DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          ref.read(browseControllerProvider.notifier).updateLocation(value);
        }
      },
    );
  }
}
