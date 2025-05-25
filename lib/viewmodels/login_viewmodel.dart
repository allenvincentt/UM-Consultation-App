import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/faculty/faculty_navbar_view.dart';
import 'package:um_consultation_app/views/student/student_navbar_view.dart';

class LoginViewModel {
  final _screen1 = StudentMainView();
  final _screen2 = FacultyMainView();
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get username => usernameController.text;
  String get password => passwordController.text;

  String facultyUsername = 'engr.jayal@ceecpe.com';
  String facultyPassword = 'ewq';
  String studentUsername = 'naive.123@naive.com';
  String studentPassword = 'qwe';

  void login(BuildContext context, String username, String password) {
      if (username == facultyUsername && password == facultyPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screen2),
      );
      } else if (username == studentUsername && password == studentPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screen1),
      );
      } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
}