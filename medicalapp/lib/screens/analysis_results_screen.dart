import 'package:flutter/material.dart';

class AnalysisResultsScreen extends StatelessWidget {
  final List<String> results = [
    "Blood Test: Normal",
    "X-Ray: No issues detected",
    "MRI: Clear",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis Results"),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(results[index]),
              subtitle: Text("Date: 2023-10-${index + 1}"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to detailed analysis view
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Viewing ${results[index]}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}