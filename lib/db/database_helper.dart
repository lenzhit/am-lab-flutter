import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        full_name TEXT NOT NULL
      )
    ''');

    // Usuarios predeterminados del sistema
    await db.insert('users', {
      'username': 'lenner',
      'password': '123456',
      'full_name': 'Lenner Zavaleta',
    });

    await db.insert('users', {
      'username': 'admin',
      'password': '123',
      'full_name': 'Administrador del Sistema',
    });
  }

  // Método de autenticación
  Future<Map<String, dynamic>?> login(String username, String password) async {
    final db = await instance.database;
    final maps = await db.query(
      'users',
      columns: ['id', 'username', 'full_name'],
      where: 'LOWER(username) = ? AND password = ?',
      whereArgs: [username.trim().toLowerCase(), password.trim()],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }

  // Registro de usuario
  Future<bool> registerUser({
    required String username,
    required String password,
    required String fullName,
  }) async {
    final db = await instance.database;
    try {
      await db.insert('users', {
        'username': username.trim().toLowerCase(),
        'password': password.trim(),
        'full_name': fullName.trim(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
