import 'package:flutter/material.dart';

class RequestListView extends StatefulWidget {
  const RequestListView({super.key});

  @override
  _RequestListViewState createState() => _RequestListViewState();
}

class _RequestListViewState extends State<RequestListView> {
  bool requestVisible = true;
  String? consultationStatus;
  String? disapprovalReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Requests')),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaders(),
            Expanded(
              child: ListView(
                children: requestVisible ? [_buildRequestCard(context)] : [],
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
          Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Request #7599'),
        subtitle: const Text('CPE 223 - Jeanelle Labsan'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () {
                setState(() {
                  requestVisible = false;
                  consultationStatus = 'Approved';
                  disapprovalReason = null;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () => _promptDisapprovalReason(context),
            ),
          ],
        ),
      ),
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
          decoration: const InputDecoration(hintText: 'Enter reason for disapproval...'),
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
}
