class Payment {
int? id;
String cardNumber;
String expiryDate;
String cvv;

Payment({
this.id,
required this.cardNumber,
required this.expiryDate,
required this.cvv,
});

Map<String, dynamic> toMap() {
return {
'id': id,
'cardNumber': cardNumber,
'expiryDate': expiryDate,
'cvv': cvv,
};
}

factory Payment.fromMap(Map<String, dynamic> map) {
return Payment(
id: map['id'],
cardNumber: map['cardNumber'],
expiryDate: map['expiryDate'],
cvv: map['cvv'],
);
}
}