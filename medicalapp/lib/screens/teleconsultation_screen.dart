import 'package:flutter/material.dart';
import 'package:medicalapp/widgets/custom_button.dart';

import '../widgets/custom_button.dart';

class TeleconsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teleconsultation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Schedule a Teleconsultation",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Doctor Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date and Time',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Schedule",
              onPressed: () {
                // Logic to schedule teleconsultation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Teleconsultation scheduled!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}