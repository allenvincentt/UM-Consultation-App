import 'package:flutter/material.dart';

import 'package:um_consultation_app/views/student/home_view.dart';
import 'package:um_consultation_app/views/student/request_view.dart';
import 'package:um_consultation_app/views/student/response_view.dart';
import 'package:um_consultation_app/views/student/menu_view.dart';


class MainViewModel{
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeView(),
    RequestView(),
    ResponseView(),
    MenuView()
  ];

  void updateIndex(int index) {
    selectedIndex = index;
  }
}