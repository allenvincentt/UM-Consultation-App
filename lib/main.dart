import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/create_account_view.dart';
import 'package:um_consultation_app/views/faculty.dart';
import 'package:um_consultation_app/views/faculty_navigation.dart';
import 'package:um_consultation_app/views/settings_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(), //change lng ang class if gusto i run ang other view file
  )); 
}