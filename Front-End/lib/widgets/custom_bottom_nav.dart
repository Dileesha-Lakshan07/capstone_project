import 'package:chat/pages/userprofile_page.dart';
import 'package:flutter/material.dart';
import 'package:chat/pages/community.dart';
import 'package:chat/pages/store_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex; // To track the selected tab
  final Function(int) onTap; // Callback function when an item is tapped

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 35,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () => onTap(0), child: const Icon(Icons.home)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StorePage(),
                    ));
              },
              child: const Icon(Icons.shopping_cart)),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommunityPage(),
                    ));
              },
              child: const Icon(Icons.people)),
          label: 'People',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => userProfile(),
                    ));
              },
              child: const Icon(Icons.account_circle)),
          label: 'Account',
        ),
      ], // Trigger onTap callback when a tab is pressed
    );
  }
}
