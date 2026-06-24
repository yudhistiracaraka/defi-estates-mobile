import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/browse_controller.dart';

class MinPriceField extends StatelessWidget {
  const MinPriceField({required this.ref, super.key});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Min Price'),
      onChanged: (value) => ref
          .read(browseControllerProvider.notifier)
          .updateMinPrice(int.tryParse(value)),
    );
  }
}
