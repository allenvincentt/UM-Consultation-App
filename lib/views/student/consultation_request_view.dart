import 'package:flutter/material.dart';

class ConsultationPageView extends StatelessWidget {
  final TextEditingController codeController = TextEditingController(text: '7599');
  final TextEditingController instructorController = TextEditingController(text: 'Jay Al Gallenero');
  final TextEditingController dateController = TextEditingController(text: '04/14/2025');
  final TextEditingController startTimeController = TextEditingController(text: '4:30 PM');
  final TextEditingController endTimeController = TextEditingController(text: '5:00 PM');

  ConsultationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text('549168', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                      Text('Naive, Allen Vincent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Choose Your Course Title', border: OutlineInputBorder()),
                  value: 'CPE 223',
                  items: const [
                    DropdownMenuItem(value: 'CPE 223', child: Text('CPE 223')),
                    DropdownMenuItem(value: 'CPE 101', child: Text('CPE 101')),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 12),
                TextField(controller: codeController, decoration: const InputDecoration(labelText: 'Course Code:', border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(controller: instructorController, decoration: const InputDecoration(labelText: 'Course Instructor:', border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date of Consultation:',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(controller: startTimeController, decoration: const InputDecoration(labelText: 'Start Time:', border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextField(controller: endTimeController, decoration: const InputDecoration(labelText: 'End Time:', border: OutlineInputBorder())),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // backend logic goes here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('✓ File Consultation Request'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('Back'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
