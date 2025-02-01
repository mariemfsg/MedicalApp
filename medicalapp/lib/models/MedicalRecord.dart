class MedicalRecord {
  final int? id;
  final String patientName;
  final int age;
  final String diagnosis;
  final String treatment;

  MedicalRecord({
    this.id,
    required this.patientName,
    required this.age,
    required this.diagnosis,
    required this.treatment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientName': patientName,
      'age': age,
      'diagnosis': diagnosis,
      'treatment': treatment,
    };
  }

  static MedicalRecord fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      id: map['id'],
      patientName: map['patientName'],
      age: map['age'],
      diagnosis: map['diagnosis'],
      treatment: map['treatment'],
    );
  }
}