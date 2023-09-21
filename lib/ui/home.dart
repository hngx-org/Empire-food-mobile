import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/colors.dart';

import 'screens/HomeScreen.dart';
import 'screens/bottom_nav_bar/NotifyScreen.dart';
import 'screens/bottom_nav_bar/UserProfile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': const HomeScreen(),
        'title': 'Home',
      },
      {
        'page':  NotificationScreen(),
        'title': 'Order',
      },
      {
        'page': UserProfile(),
        'title': 'Profile',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _selectPage,
        backgroundColor: Color(0xffF5C2B1),
        unselectedItemColor: AppColors.navigationButtonInactive,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            
            icon: Icon(Icons.person),
            label: 'User Profile',
          ),
        ],
      ),
    );
  }
}
