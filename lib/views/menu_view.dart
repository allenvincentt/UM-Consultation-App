import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/login_view.dart';
import 'package:um_consultation_app/viewmodels/login_viewmodel.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  MenuViewState createState() => MenuViewState();
}

class MenuViewState extends State<MenuView> {
  bool _accountExpanded = false;

  String studentName = "Naive, Allen Vincent";
  String studentEmail = LoginViewModel().studentUsername;
  String studentPassword = LoginViewModel().studentPassword;

  void _changePassword() {
    String newPassword = '';
    String confirmPassword = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
                onChanged: (value) => newPassword = value,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Confirm Password"),
                onChanged: (value) => confirmPassword = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newPassword.isEmpty || confirmPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill both fields')),
                  );
                } else if (newPassword != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match')),
                  );
                } else {
                  setState(() {
                    studentPassword = newPassword;
                    LoginViewModel().studentPassword = newPassword;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password updated')),
                  );
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFA1000B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ExpansionTile(
              title: const Text("Account Management"),
              leading: const Icon(Icons.account_circle),
              trailing: Icon(
                _accountExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.grey,
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _accountExpanded = expanded;
                });
              },
              children: [
                ListTile(
                  title: const Text("Name"),
                  subtitle: Text(studentName),
                ),
                ListTile(
                  title: const Text("Email/Username"),
                  subtitle: Text(studentEmail),
                ),
                ListTile(
                  title: const Text("Password"),
                  subtitle: Text('*' * studentPassword.length),
                  trailing: TextButton(
                    onPressed: _changePassword,
                    child: const Text("Change Password"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
