import 'package:flutter/material.dart';

import '../../const/colors.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      
      selectedItemColor: blueColor,
      unselectedItemColor: black.withOpacity(0.5),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      selectedLabelStyle: textTheme.bodySmall,
      unselectedLabelStyle: textTheme.bodySmall,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        print("index $index");
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
