import 'package:flutter/material.dart';

import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/about/presentation/about_screen.dart';
import 'features/admin/presentation/admin_screen.dart';
import 'features/app/presentation/app_shell.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/properties/domain/app_models.dart';
import 'features/properties/presentation/property_detail_screen.dart';
import 'features/user/presentation/user_dashboard_screen.dart';

class DefiEstatesApp extends StatelessWidget {
  const DefiEstatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeFi Estates',
      theme: AppTheme.dark(),
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return _buildRoute(
              const AppShell(currentIndex: 0, child: HomeScreen()),
            );
          case AppRoutes.about:
            return _buildRoute(
              const AppShell(currentIndex: 3, child: AboutScreen()),
            );
          case AppRoutes.browse:
            return _buildRoute(
              const AppShell(currentIndex: 1, child: AppShellBrowseBody()),
            );
          case AppRoutes.user:
            return _buildRoute(
              const AppShell(currentIndex: 2, child: UserDashboardScreen()),
            );
          case AppRoutes.admin:
            return _buildRoute(
              const AppShell(currentIndex: 2, child: AdminScreen()),
            );
          case AppRoutes.propertyDetail:
            final property = settings.arguments! as Property;
            return _buildRoute(PropertyDetailScreen(property: property));
          default:
            return _buildRoute(
              const AppShell(currentIndex: 0, child: HomeScreen()),
            );
        }
      },
    );
  }

  PageRoute<void> _buildRoute(Widget child) {
    return PageRouteBuilder<void>(
      transitionDuration: const Duration(milliseconds: 380),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, animation, __) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionsBuilder: (_, animation, __, page) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        final position = Tween<Offset>(
          begin: const Offset(0.035, 0),
          end: Offset.zero,
        ).animate(curved);

        return SlideTransition(position: position, child: page);
      },
    );
  }
}
