import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/browse_controller.dart';

class MaxPriceField extends StatelessWidget {
  const MaxPriceField({required this.ref, super.key});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Max Price'),
      onChanged: (value) => ref
          .read(browseControllerProvider.notifier)
          .updateMaxPrice(int.tryParse(value)),
    );
  }
}
