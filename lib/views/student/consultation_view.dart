import 'package:flutter/material.dart';

class ConsultationView extends StatelessWidget {
  final TextEditingController codeController = TextEditingController(text: '7599');
  final TextEditingController instructorController = TextEditingController(text: 'Jay Al Gallenero');
  final TextEditingController dateController = TextEditingController(text: '04/14/2025');
  final TextEditingController startTimeController = TextEditingController(text: '4:30 PM');
  final TextEditingController endTimeController = TextEditingController(text: '5:00 PM');

  ConsultationView({super.key});

  List<String> availableStartTime = [
    '7:00 AM', '7:30 AM', '8:00 AM', '8:30 AM', '9:00 AM', '9:30 AM', '10:00 AM',
    '10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM',
    '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM',
    '7:30 PM', '8:00 PM', '8:30 PM', '9:00 PM', '9:30 PM',
  ];

  List<String> availableEndTime = [
    '8:00 AM', '8:30 AM', '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM',
    '11:00 AM', '11:30 AM', '12:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM',
    '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM',
    '7:00 PM', '7:30 PM', '8:00 PM', '8:30 PM', '9:00 PM', '9:30 PM',
  ];

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
                      Text('549168', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFA1000B))),
                      Text('Naive, Allen Vincent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Choose Your Course Title', border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF2CE22), width: 2),
                  )),
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
                
                TextFormField(
                  controller: dateController,
                  readOnly: true, // Prevent manual input
                  decoration: InputDecoration(
                    labelText: 'Date of Consultation:',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      dateController.text = "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                    }
                  },
                ),

                //start time
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Start Time:',
                    border: OutlineInputBorder(),
                  ),
                  value: availableStartTime[0], // Default selection
                  items: availableStartTime.map((time) {
                    return DropdownMenuItem(value: time, child: Text(time));
                  }).toList(),
                  onChanged: (selectedTime) {
                    startTimeController.text = selectedTime!;
                  },
                ),


                //end time
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'End Time:',
                    border: OutlineInputBorder(),
                  ),
                  value: availableEndTime[1], // Default selection
                  items: availableEndTime.map((time) {
                    return DropdownMenuItem(value: time, child: Text(time));
                  }).toList(),
                  onChanged: (selectedTime) {
                    endTimeController.text = selectedTime!;
                  },
                ),


                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // backend logic goes here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        foregroundColor: Colors.white,
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
                        foregroundColor: Colors.white,
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
