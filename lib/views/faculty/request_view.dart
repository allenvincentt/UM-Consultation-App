import 'package:flutter/material.dart';
import 'package:um_consultation_app/views/student/menu_view.dart';

class FacultyView extends StatefulWidget {
  const FacultyView({super.key});

  @override
  _FacultyViewState createState() => _FacultyViewState();
}

class _FacultyViewState extends State<FacultyView> {
  String selectedTab = 'Requests';
  final List<String> options = ['Requests', 'Consultations'];

  // Only one request to manage
  bool requestVisible = true;

  // Consultation data
  String? consultationStatus;
  String? disapprovalReason;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Dropdown
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: selectedTab,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: selectedTab,
                items: options
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedTab = newValue;
                    });
                  }
                },
              ),
            ),

            // Headers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(selectedTab == 'Requests' ? 'Action' : 'Status',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                children: [
                  if (selectedTab == 'Requests' && requestVisible)
                    _buildRequestCard(context),
                  if (selectedTab == 'Consultations' && consultationStatus != null)
                    _buildConsultationCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailsColumn(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        requestVisible = false;
                        consultationStatus = 'Approved';
                        disapprovalReason = null;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.green.shade50,
                      child: Icon(Icons.check, color: Colors.green),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => _promptDisapprovalReason(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.red.shade50,
                      child: Icon(Icons.close, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsultationCard(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (consultationStatus) {
      case 'Approved':
        bgColor = Colors.green.shade50;
        textColor = Colors.green;
        break;
      case 'Disapproved':
        bgColor = Colors.red.shade50;
        textColor = Colors.red;
        break;
      default:
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailsColumn(),
              InkWell(
                onTap: () {
                  if (consultationStatus == 'Disapproved') {
                    _showDisapprovalReason(context);
                  }
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    consultationStatus!,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('7599', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('CPE 223'),
        Text('Jeanelle Labsan'),
        SizedBox(height: 8),
        Text('Mon, April 14, 2025', style: TextStyle(color: Color(0xFFA1000B)),),
        Text('4:30 PM - 5:00PM', style: TextStyle(color: Color(0xFFA1000B)),),
      ],
    );
  }

  void _promptDisapprovalReason(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Disapprove Request'),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter reason for disapproval...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                requestVisible = false;
                consultationStatus = 'Disapproved';
                disapprovalReason = controller.text.trim().isEmpty
                    ? 'No reason provided.'
                    : controller.text.trim();
              });
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showDisapprovalReason(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Disapproval Reason'),
        content: Text(disapprovalReason ?? 'No reason provided.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
