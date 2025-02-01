import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/MedicalRecord.dart'; // Assurez-vous que le chemin est correct

class DatabaseService {
  // Singleton pattern pour une seule instance de DatabaseService
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database? _database;

  DatabaseService._internal();

  // Getter pour accéder à la base de données
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Méthode pour initialiser la base de données
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'medical_records.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Méthode pour créer la table lors de la première initialisation
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE medical_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        patientName TEXT,
        age INTEGER,
        diagnosis TEXT,
        treatment TEXT
      )
    ''');
  }

  // Méthode pour insérer un enregistrement médical
  Future<int> insertMedicalRecord(MedicalRecord record) async {
    final db = await database;
    return await db.insert(
      'medical_records',
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Méthode pour récupérer tous les enregistrements médicaux
  Future<List<MedicalRecord>> getMedicalRecords() async {
    final db = await database;
    final result = await db.query('medical_records');
    return result.map((map) => MedicalRecord.fromMap(map)).toList();
  }

  // Méthode pour récupérer un utilisateur (à implémenter)
  Future<User> getUser(String username) async {
    // Implémentez la logique pour récupérer un utilisateur
    throw UnimplementedError("getUser() n'est pas encore implémenté.");
  }
}