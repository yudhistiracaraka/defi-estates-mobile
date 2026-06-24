import 'package:flutter/material.dart';

import '../../../../core/widgets/section_header.dart';
import 'widgets/about_grid.dart';
import 'widgets/developer_panel.dart';
import 'widgets/tech_overview.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      children: const [
        SectionHeader(
          title: 'Revolutionizing Real Estate Investment',
          subtitle:
              'DeFi Estates bridges traditional real estate and blockchain technology to make property investment more accessible, transparent, and efficient.',
        ),
        SizedBox(height: 20),
        AboutGrid(),
        SizedBox(height: 28),
        TechOverview(),
        SizedBox(height: 28),
        DeveloperPanel(),
      ],
    );
  }
}
