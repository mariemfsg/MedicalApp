import 'package:flutter/material.dart';
import 'package:medicalapp/screens/MedicalRecordScreen.dart';
import 'package:medicalapp/screens/payment_screen.dart';
import 'package:medicalapp/screens/teleconsultation_screen.dart';
import 'package:medicalapp/screens/analysis_results_screen.dart';
import '../widgets/custom_button.dart';
import 'PaymentListScreen.dart';
import 'UserListScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Dossiers Médicaux",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicalRecord()),
                  );
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Résultats d'Analyse",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnalysisResultsScreen()),
                  );
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Téléconsultation",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeleconsultationScreen()),
                  );
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Paiements",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserListScreen()),
                  );
                },
                child: Text("Voir les Utilisateurs"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentListScreen()),
                  );
                },
                child: Text("Voir les Paiements"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}