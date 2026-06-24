import 'package:flutter/material.dart';

class AdminActions extends StatelessWidget {
  const AdminActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ],
    );
  }
}
