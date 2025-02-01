import 'package:flutter/material.dart';
import '../services/blockchain_service.dart';
class MedicalRecord extends StatefulWidget {
  @override
  _MedicalRecordState createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  final BlockchainService _blockchainService = BlockchainService();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _treatmentController = TextEditingController();
  final TextEditingController _recordIdController = TextEditingController();

  List<Map<String, dynamic>> records = [];

  Future<void> _addRecord() async {
    await _blockchainService.addRecord(
      _patientNameController.text,
      int.parse(_ageController.text),
      _diagnosisController.text,
      _treatmentController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Record added to blockchain")),
    );
  }

  Future<void> _getRecord() async {
    final record = await _blockchainService.getRecord(int.parse(_recordIdController.text));
    setState(() {
      records.add({
        'id': record[0],
        'patientName': record[1],
        'age': record[2],
        'diagnosis': record[3],
        'treatment': record[4],
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medical Records")),
      body: Column(
        children: [
          // Formulaire pour ajouter un enregistrement
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(controller: _patientNameController, decoration: InputDecoration(labelText: "Patient Name")),
                TextField(controller: _ageController, decoration: InputDecoration(labelText: "Age")),
                TextField(controller: _diagnosisController, decoration: InputDecoration(labelText: "Diagnosis")),
                TextField(controller: _treatmentController, decoration: InputDecoration(labelText: "Treatment")),
                ElevatedButton(onPressed: _addRecord, child: Text("Add Record")),
              ],
            ),
          ),

          // Liste des enregistrements
          Expanded(
            child: ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return ListTile(
                  title: Text("Patient: ${record['patientName']}"),
                  subtitle: Text("Diagnosis: ${record['diagnosis']}"),
                );
              },
            ),
          ),

          // Formulaire pour récupérer un enregistrement
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _recordIdController,
                  decoration: InputDecoration(labelText: "Record ID"),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: _getRecord,
                  child: Text("Get Record"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}