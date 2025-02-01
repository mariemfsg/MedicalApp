import 'package:flutter/material.dart';

import 'package:medicalapp/screens/analysis_results_screen.dart';
import 'package:medicalapp/screens/home_screen.dart';
import 'package:medicalapp/screens/login_screen.dart';
import 'package:medicalapp/screens/MedicalRecordScreen.dart';
import 'package:medicalapp/screens/payment_screen.dart';
import 'package:medicalapp/screens/teleconsultation_screen.dart';
import 'package:medicalapp/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().database; // Initialize database
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/medical_records': (context) => MedicalRecord(),
        '/analysis_results': (context) => AnalysisResultsScreen(),
        '/teleconsultation': (context) => TeleconsultationScreen(),
        '/payment': (context) => PaymentScreen(),
      },
    );
  }
}