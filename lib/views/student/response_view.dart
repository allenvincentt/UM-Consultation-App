import 'package:flutter/material.dart';

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
      'color': const Color.fromARGB(255, 251, 245, 185),
      'textColor': const Color.fromARGB(255, 183, 130, 26),
    },
    'Approved': {
      'color': Colors.green.shade100,
      'textColor': Colors.green,
    },
    'Disapproved': {
      'color': Colors.red.shade100,
      'textColor': const Color(0xffa1000b),
    },
    'Done': {
      'color': Colors.grey.shade300,
      'textColor': const Color(0xff656565),
    },
  };

  final List<List<String>> consultationData = [
    ["7599", "CPE 223", "Jay Al Gallenero", "Mon, April 14, 2025", "4:30 PM - 5:30 PM", "Pending"],
    ["7600", "CPE 224", "Maria Cruz", "Tue, April 15, 2025", "2:00 PM - 3:00 PM", "Approved"],
    ["7601", "CPE 225", "Juan Dela Cruz", "Wed, April 16, 2025", "1:00 PM - 2:00 PM", "Disapproved"],
    ["7602", "CPE 226", "Ana Santos", "Thu, April 17, 2025", "10:00 AM - 11:00 AM", "Done"],
    ["7603", "CPE 227", "Seok Jin Santos", "Fri, April 18, 2025", "10:00 AM - 11:00 AM", "Disapproved"],
    ["7604", "CPE 228", "Namjoon Salazar", "Sat, April 19, 2025", "4:00 PM - 5:00 PM", "Approved"],
    ["7605", "CPE 229", "Yoongi Garcia", "Mon, April 21, 2025", "6:00 PM - 7:00 PM", "Pending"],
    ["7606", "CPE 230", "Hoseok Martinez", "Thu, April 17, 2025", "10:00 AM - 11:00 AM", "Done"],
  ];

  late List<Consultation> consultations;

  @override
  void initState() {
    super.initState();
    consultations = consultationData.map((data) => Consultation.fromList(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var filteredConsultations = selectedStatus == 'All'
        ? consultations
        : consultations.where((c) => c.status == selectedStatus).toList();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: Text(
                "Consultation Responses",
                style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffa1000b)),
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.001), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
                Divider(thickness: 1),
              ],
            ),
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
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(consultation.courseCode,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045)),
                                Text(consultation.courseName, style: TextStyle(fontSize: screenWidth * 0.04)),
                                Text(consultation.facultyName, style: TextStyle(fontSize: screenWidth * 0.04)),
                                SizedBox(height: screenHeight * 0.01),
                                Text(consultation.date,
                                    style: TextStyle(color: const Color(0xffa1000b), fontSize: screenWidth * 0.04)),
                                Text(consultation.time,
                                    style: TextStyle(color: const Color(0xffa1000b), fontSize: screenWidth * 0.04)),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.005, 
                              horizontal: screenWidth * 0.05,
                            ),
                            decoration: BoxDecoration(
                              color: statusStyle["color"],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                consultation.status,
                              style: TextStyle(
                                color: statusStyle["textColor"],
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                          ),
                          ),
                          ),
                        ],
                      ),
                      Divider(thickness: 1),
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