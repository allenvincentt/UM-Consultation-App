import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
    "Settings",
    style: TextStyle(
      color: Colors.white, // Change font color here
      fontWeight: FontWeight.bold, // Optional: Make text bold
      fontSize: 20, // Optional: Adjust font size
    ),
  ),
  backgroundColor: Color(0xFFA1000B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [//dungag lng listTile if naa i add na setting/feature
            ListTile(
              leading: Icon(Icons.account_circle),
              title: const Text("Account Management"),
              onTap: () {
                //logic
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                //logout logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
