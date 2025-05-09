import 'package:flutter/material.dart';
import 'package:um_consultation_app/viewmodels/faculty/faculty_main_viewmodel.dart';

class FacultyMainView extends StatefulWidget {
  const FacultyMainView({super.key});

  @override
  State<FacultyMainView> createState() => _FacultyMainViewState();
}

class _FacultyMainViewState extends State<FacultyMainView> {
  final FacultyMainViewmodel _mainViewModel = FacultyMainViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainViewModel.screens[_mainViewModel.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'Request List'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Consultation List'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
        currentIndex: _mainViewModel.selectedIndex,
        selectedItemColor: Color(0xFFA1000B),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _mainViewModel.updateIndex(index);
          });
        },
      ),
    );
  }
}