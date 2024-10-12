import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Index of the selected item in the bottom navigation bar
  int _selectedIndex = 0;

  // List of pages (screens) to navigate between
  final List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
  ];

  // Function to handle navigation when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
