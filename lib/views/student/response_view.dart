import 'package:flutter/material.dart';
//straight from gdrive, haven't been modified, tested and debugged
// MODEL FOR CONSUL DATA:>
class Consultation {
  final String courseCode;
  final String courseName;
  final String facultyName;
  final String date;
  final String time;
  final String status;

  Consultation({
    required this.courseCode,
    required this.courseName,
    required this.facultyName,
    required this.date,
    required this.time,
    required this.status,
  });
  factory Consultation.fromList(List<String> data) {
    return Consultation(
      courseCode: data[0],
      courseName: data[1],
      facultyName: data[2],
      date: data[3],
      time: data[4],
      status: data[5],
    );
  }
}

class ResponseView extends StatefulWidget {
  const ResponseView({Key? key}) : super(key: key);

  @override
  _ConsultationResponseViewState createState() =>
      _ConsultationResponseViewState();
}

class _ConsultationResponseViewState extends State<ResponseView> {
  String selectedStatus = 'All';
  final Map<String, Map<String, dynamic>> statusStyles = {
    'Pending': {
      'color': Colors.orange.shade100,
      'textColor': Colors.orange,
    },
    'Approved': {
      'color': Colors.green.shade100,
      'textColor': Colors.green,
    },
    'Disapproved': {
      'color': Colors.red.shade100,
      'textColor': Colors.red,
    },
    'Done': {
      'color': Colors.grey.shade300,
      'textColor': Colors.grey,
    },
  };

  // EXAMPLE
  final List<List<String>> consultationData = [
    ["7599", "CPE 223", "Jay Al Gallenero", "Mon, April 14, 2025", "4:30 PM - 5:30 PM", "Pending"],
    ["7600", "CPE 224", "Maria Cruz", "Tue, April 15, 2025", "2:00 PM - 3:00 PM", "Approved"],
    ["7601", "CPE 225", "Juan Dela Cruz", "Wed, April 16, 2025", "1:00 PM - 2:00 PM", "Disapproved"],
    ["7602", "CPE 226", "Ana Santos", "Thu, April 17, 2025", "10:00 AM - 11:00 AM", "Done"],
    ["7603", "CPE 227", "Burst Fade", "Mon, April 18, 2025", "1:00 AM - 2:00 AM", "Pending"],
    ["7604", "CPE 228", "Pa Rin", "Mon, April 19, 2025", "2:00 AM - 3:00 AM", "Pending"],
    ["7605", "CPE 229", "To Ya", "Mon, April 20, 2025", "4:00 AM - 5:00 AM", "Pending"],
  ];

  late List<Consultation> consultations;

  @override
  void initState() {
    super.initState();
    // CONVERT EXAMPLE DATA TO CONSULTATION OBJECTS
    consultations = consultationData
        .map((data) => Consultation.fromList(data))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // FILTER BASED ON STATUS
    var filteredConsultations = selectedStatus == 'All'
        ? consultations
        : consultations.where((c) => c.status == selectedStatus).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text("Consultation Responses", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // FILTER DROPDOWN
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedStatus,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ['All', 'Pending', 'Approved', 'Disapproved', 'Done']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value ?? 'All';
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            // HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(),
            // LIST OF CONSULTATIONS
            Expanded(
              child: ListView.builder(
                itemCount: filteredConsultations.length,
                itemBuilder: (context, index) {
                  var consultation = filteredConsultations[index];
                  var statusStyle = statusStyles[consultation.status]!;

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CONSULTATION DETAILS
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(consultation.courseCode, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(consultation.courseName),
                              Text(consultation.facultyName),
                              const SizedBox(height: 6),
                              Text(consultation.date, style: const TextStyle(color: Colors.red)),
                              Text(consultation.time, style: const TextStyle(color: Colors.red)),
                            ],
                          ),

                          // STATUS
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusStyle["color"],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              consultation.status,
                              style: TextStyle(
                                color: statusStyle["textColor"],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
