import 'package:flutter/material.dart';
//straight from gdrive, haven't been modified, tested and debugged
class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        color: Colors.white, //BLANK PAGE
      ),
      
    );
  }
}