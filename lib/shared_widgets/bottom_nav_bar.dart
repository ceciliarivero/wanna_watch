import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedScreenIndex,
    required this.onTap,
  });

  final int selectedScreenIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'My list',
        ),
      ],
      currentIndex: selectedScreenIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: theme.secondaryHeaderColor,
      onTap: onTap,
      backgroundColor: theme.primaryColorDark,
      unselectedFontSize: 16.0,
      selectedFontSize: 16.0,
      iconSize: 30,
    );
  }
}
