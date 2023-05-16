import 'package:sqflite/sqflite.dart';
import '../../../muyu/models/merit_record.dart';

class MeritRecordDao {
  final Database database;

  MeritRecordDao(this.database);

  static String tableName = 'merit_record';

  static String tableSql = """
CREATE TABLE $tableName (
id VARCHAR(64) PRIMARY KEY,
value INTEGER, 
image TEXT,
audio TEXT,
timestamp INTEGER
)""";

  static Future<void> createTable(Database db) async{
   return db.execute(tableSql);
  }

  Future<int> insert(MeritRecord record) {
    return database.insert(
      tableName,
      record.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MeritRecord>> query() async {
    List<Map<String, Object?>> data = await database.query(
      tableName,
    );

    return data
        .map((e) => MeritRecord(
              e['id'].toString(),
              e['timestamp'] as int,
              e['value'] as int,
              e['image'].toString(),
              e['audio'].toString(),
            ))
        .toList();
  }
}
