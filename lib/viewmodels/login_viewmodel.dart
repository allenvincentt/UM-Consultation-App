import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/faculty/request_list_view.dart';
import 'package:um_consultation_app/views/student/student_main_view.dart';

class LoginViewModel {
  final _screen1 = StudentMainView();
  final _screen2 = FacultyMainView();
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get username => usernameController.text;
  String get password => passwordController.text;

  String facultyUsername = 'JayAl';
  String facultyPassword = '321';
  String studentUsername = 'Naive';
  String studentPassword = '123';

  void login(BuildContext context, String username, String password) {
    // Perform login logic here
    // For example, you can check if the username and password are correct
      if (username == facultyUsername && password == facultyPassword) {
      // If login is successful, navigate to the home view
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screen2),
      );
      } else if (username == studentUsername && password == studentPassword) {
      // If login is successful, navigate to the home view
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screen1),
      );
      } else {
      // If login fails, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
}