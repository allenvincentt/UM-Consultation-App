import 'package:flutter/material.dart';
import 'package:um_consultation_app/viewmodels/student/student_main_viewmodel.dart';

class StudentMainView extends StatefulWidget {
  const StudentMainView({super.key});

  @override
  State<StudentMainView> createState() => _MainViewState();
}

class _MainViewState extends State<StudentMainView> {
  final MainViewModel _mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainViewModel.screens[_mainViewModel.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Request'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Response'),
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