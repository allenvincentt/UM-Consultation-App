import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/login_view.dart';

class CreateAccountViewModel extends ChangeNotifier {
  final BuildContext context;
  String email = '';
  String password = '';
  String confirmPassword = '';

  CreateAccountViewModel(this.context);

  bool get hasUnsavedData =>
      email.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty;

  Future<bool> handleBackNavigation() async {
    if (hasUnsavedData) {
      return await _showConfirmationDialog();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
    return false;
  }

  Future<bool> _showConfirmationDialog() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Unsaved Changes'),
            content: Text('You have unsaved changes. Do you really want to go back?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}