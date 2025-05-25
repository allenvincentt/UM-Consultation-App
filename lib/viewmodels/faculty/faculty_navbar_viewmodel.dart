import 'package:flutter/material.dart';

import 'package:um_consultation_app/views/faculty/request_list_view.dart';
import 'package:um_consultation_app/views/faculty/consultation_list_view.dart';
import 'package:um_consultation_app/views/menu_view.dart';


class FacultyMainViewmodel{
  int selectedIndex = 0;

  final List<Widget> screens = [
    RequestListView(),
    ConsultationListView(),
    MenuView()
  ];

  void updateIndex(int index) {
    selectedIndex = index;
  }
}