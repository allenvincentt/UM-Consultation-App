  import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/create_account_view.dart';
import 'package:um_consultation_app/views/faculty/consultation_list_view.dart';
import 'package:um_consultation_app/views/faculty/request_list_view.dart';
import 'package:um_consultation_app/views/login_view.dart';
import 'package:um_consultation_app/views/student/consultation_view.dart';
import 'package:um_consultation_app/views/student/menu_view.dart';
import 'package:um_consultation_app/views/student/home_view.dart';
import 'package:um_consultation_app/views/student/request_view.dart';
import 'package:um_consultation_app/views/student/response_view.dart';
import 'package:um_consultation_app/views/student/student_main_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginView(), //change lng ang class if gusto i run ang other view file
  )); 
}