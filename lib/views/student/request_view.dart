 import 'package:flutter/material.dart';
import 'consultation_view.dart'; // Import the other page

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {'code': '6010', 'course': 'UGE 2', 'instructor': 'Juan Dela Cruz'},
      {'code': '9193', 'course': 'CEE 104', 'instructor': 'Mark Anthony'},
      {'code': '1010', 'course': 'CPE 101', 'instructor': 'Nate Smog'},
      {'code': '1010', 'course': 'PAHF 4', 'instructor': 'Eva Adam'},
    ];

    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: const [
                    Text('549168', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                    Text('Naive, Allen Vincent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Second Semester 24-25', style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold)),
                    Text('Second Year BSCPE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                value: 'Second Semester 2024 - 2025',
                items: const [
                  DropdownMenuItem(
                    value: 'Second Semester 2024 - 2025',
                    child: Text('Second Semester 2024 - 2025'),
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConsultationView()),
                    );
                  },
                  icon: const Icon(Icons.note_add),
                  label: const Text('Request Consultation'),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      children: [
                        tableCell('Code', isHeader: true),
                        tableCell('Course', isHeader: true),
                        tableCell('Instructor', isHeader: true),
                      ],
                    ),
                    ...courses.map((course) {
                      return TableRow(
                        children: [
                          tableCell(course['code']!),
                          tableCell(course['course']!),
                          tableCell(course['instructor']!),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget tableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }
}
