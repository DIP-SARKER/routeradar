import 'package:flutter/material.dart';

class FeedbackComplaintsPage extends StatefulWidget {
  const FeedbackComplaintsPage({super.key});

  @override
  State<FeedbackComplaintsPage> createState() => _FeedbackComplaintsPageState();
}

class _FeedbackComplaintsPageState extends State<FeedbackComplaintsPage> {
  final TextEditingController _feedbackController = TextEditingController();
  String? _complaintType;

  final List<String> _complaintTypes = [
    'Service Issue',
    'App Feedback',
    'Payment Problem',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback & Complaints"),
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let us know your thoughts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your feedback helps us improve. Share your experiences or report an issue.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Complaint Type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: _complaintType,
                items: _complaintTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _complaintType = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Your Feedback",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    final feedback = _feedbackController.text;
                    if (_complaintType == null || feedback.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Incomplete Information"),
                          content: const Text(
                              "Please fill in all fields before submitting."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Submit feedback logic can go here
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Thank You!"),
                          content: const Text(
                              "Your feedback has been submitted successfully."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                      _feedbackController.clear();
                      setState(() {
                        _complaintType = null;
                      });
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
