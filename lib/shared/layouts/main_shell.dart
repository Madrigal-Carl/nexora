import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: CurvedNavigationBar(
        index: navigationShell.currentIndex,
        height: 60,
        backgroundColor: Colors.transparent,
        color: AppColors.secondary,
        buttonBackgroundColor: AppColors.secondary,
        onTap: _onTap,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.auto_awesome, color: Colors.white),
          Icon(Icons.folder, color: Colors.white),
        ],
      ),
    );
  }
}
