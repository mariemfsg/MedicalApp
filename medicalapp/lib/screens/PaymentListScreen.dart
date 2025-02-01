import 'package:flutter/material.dart';
import 'package:medicalapp/services/database_service.dart';
import 'package:medicalapp/models/payment.dart';

class PaymentListScreen extends StatefulWidget {
  @override
  _PaymentListScreenState createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {
  late Future<List<Payment>> _payments;

  @override
  void initState() {
    super.initState();
    _payments = DatabaseService().getAllPayments(); // Ajoutez cette méthode dans DatabaseService
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Paiements"),
      ),
      body: FutureBuilder<List<Payment>>(
        future: _payments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Aucun paiement trouvé."));
          } else {
            final payments = snapshot.data!;
            return ListView.builder(
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final payment = payments[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Carte: ${payment.cardNumber}"),
                    subtitle: Text("Expire le: ${payment.expiryDate}"),
                    trailing: Text("CVV: ${payment.cvv}"),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}