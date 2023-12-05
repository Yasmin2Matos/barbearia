import 'package:sqflite_common/sqflite.dart' as sql;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/* void main() async {
  sqfliteFfiInit();
  sql.DatabaseFactory databaseFactory = databaseFactoryFfi;
  Database database = await openDatabase('database_name.db');
  runApp(SQLHelper());
}

void runApp(SQLHelper sqlHelper) {}*/

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE data(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nome TEXT,
      servico TEXT,
      horaEntrada TEXT,
      horaSaida TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("database_name.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createData(
      String nome, String servico, String horaEntrada, String horaSaida) async {
    final db = await SQLHelper.db();
    final data = {
      'nome': nome,
      'servico': servico,
      'horaEntrada': horaEntrada,
      'horaSaida': horaSaida
    };
    final id = await db.insert('data', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SQLHelper.db();
    return db.query('data', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query('data', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(int id, String nome, String servico,
      String horaEntrada, String horaSaida) async {
    final db = await SQLHelper.db();
    final data = {
      'nome': nome,
      'servico': servico,
      'horaEntrada': horaEntrada,
      'horaSaida': horaSaida
    };
    final result =
        await db.update('data', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('data', where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }
}
