import 'package:flutter/material.dart';
import '../viewmodels/test_viewmodels.dart'; // Import ViewModel

class TestView extends StatelessWidget {
  final TestViewModel viewModel = TestViewModel(); // Instantiate ViewModel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test View'),
      ),
      body: Center(
        child: Text(viewModel.message), // Access data from ViewModel
      ),
    );
  }
}
