import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/faculty/request_view.dart';
import 'package:um_consultation_app/views/student/menu_view.dart';

class FacultyMainView extends StatefulWidget {
  const FacultyMainView({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

//like it or not need ni siya na class for bottom navigation therefore i call ni na class sa main.dart

class HomeScreenState extends State<FacultyMainView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    FacultyView(),  // Requests Screen
    Container(),    // ayaw lng sa i click ang middle sa buttons or else mag crash ang app HAHAHAHAAHA
    MenuView(), // Settings Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFA1000B),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Table'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
