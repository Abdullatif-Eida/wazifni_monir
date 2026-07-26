import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'applications_screen.dart';
import 'home_screen.dart';
import 'job_management_screen.dart';
import 'org_profile_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  static const _screens = [
    HomeScreen(),
    ApplicationsScreen(),
    JobManagementScreen(),
    OrgProfileScreen(),
  ];

  static const _items = [
    (icon: Icons.home_outlined, activeIcon: Icons.home, label: 'الرئيسية'),
    (
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment,
      label: 'طلباتي'
    ),
    (
      icon: Icons.work_outline_rounded,
      activeIcon: Icons.work_rounded,
      label: 'الوظائف'
    ),
    (
      icon: Icons.apartment_outlined,
      activeIcon: Icons.apartment,
      label: 'الملف الشخصي'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        backgroundColor: AppColors.card,
        indicatorColor: AppColors.goldLight,
        destinations: [
          for (final item in _items)
            NavigationDestination(
              icon: Icon(item.icon),
              selectedIcon: Icon(item.activeIcon, color: AppColors.darkGreen),
              label: item.label,
            ),
        ],
      ),
    );
  }
}
