import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomNavRail extends StatelessWidget {
  const CustomNavRail(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.navigationRailDestination});

  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final NavigationRailDestination navigationRailDestination;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      groupAlignment: 0,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      selectedIconTheme: const IconThemeData(color: Colors.grey),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
      labelType: NavigationRailLabelType.none,
      backgroundColor: CustomColors.adminPrimary,
      useIndicator: false,
      destinations: [
        navigationRailDestination
      ],
    );
  }
}
