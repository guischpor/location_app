import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbPlaces {
  //metodo que cria o database
  static Future<sql.Database> dataBase() async {
    //variavel que pega o caminho do database
    final dbPath = await sql.getDatabasesPath();

    //agora precisamos passar o caminho e cria o arquivo database
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT)',
        );
      },
      version: 1,
    );
  }

  //metodo que irá inserir novos dados na tabela
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbPlaces.dataBase();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  //metodo que obtem a lista de dados
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbPlaces.dataBase();
    return db.query(table);
  }
}
