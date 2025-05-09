import 'package:flutter/material.dart';

class ConsultationListView extends StatefulWidget {
  const ConsultationListView({super.key});

  @override
  _ConsultationListViewState createState() => _ConsultationListViewState();
}

class _ConsultationListViewState extends State<ConsultationListView> {
  String? consultationStatus;
  String? disapprovalReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consultations')),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaders(),
            Expanded(
              child: ListView(
                children: consultationStatus != null ? [_buildConsultationCard(context)] : [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
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

    return Card(
      child: ListTile(
        title: const Text('Consultation #7599'),
        subtitle: const Text('CPE 223 - Jeanelle Labsan'),
        trailing: InkWell(
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
              consultationStatus ?? 'Pending',
              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
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
