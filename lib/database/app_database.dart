import 'package:barberia/models/barbeiro.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'barbearia.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE barbeiros('
          'id INTEGER PRIMARY KEY,'
          'nome TEXT, '
          'servicos TEXT,'
          'horaEntrada TEXT,'
          'horaSaida TEXT'
          ')');
    }, version: 1);
  });
}

Future<int> save(Barbeiro barbeiro) {
  return createDatabase().then((db) {
    final Map<String, dynamic> barbeiroMap = Map();
    barbeiroMap['id'] = barbeiro.id;
    barbeiroMap['nome'] = barbeiro.nome;
    barbeiroMap['servicos'] = barbeiro.servicos;
    barbeiroMap['horaEntrada'] = barbeiro.horaEntrada;
    barbeiroMap['horaSaida'] = barbeiro.horaSaida;
    return db.insert('barbeiros', barbeiroMap);
  });
}

/*Future<List<Barbeiro>> findAll() {
  return createDatabase().then((db) {
    return db.query('barbeiros').then((List<Map<String, dynamic>> maps) {
      final List<Barbeiro> barbeiros = [];
      for (Map<String, dynamic> map in maps) {
        final Barbeiro barbeiro = Barbeiro(
          map['id'],
          map['nome'],
          map['servicos'],
          map['horaEntrada'],
          map['horaSaida'],
        );
        barbeiros.add(barbeiro);
      }
      return barbeiros;
    });
  }); 
} */
