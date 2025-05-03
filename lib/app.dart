import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/create_account_view.dart';
import 'package:um_consultation_app/views/faculty/request_view.dart';
import 'package:um_consultation_app/views/faculty/faculty_main_view.dart';
import 'package:um_consultation_app/views/login_view.dart';
import 'package:um_consultation_app/views/student/menu_view.dart';
import 'package:um_consultation_app/views/student/home_view.dart';
import 'package:um_consultation_app/views/student/student_main_view.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StudentMainView(), //change lng ang class if gusto i run ang other view file
  )); 
}