import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import 'dao/merit_record_dao.dart';


class DbStorage {
  DbStorage._();

  static DbStorage? _storage;

  static DbStorage get instance {
    _storage = _storage ?? DbStorage._();
    return _storage!;
  }

  late Database _db;

  late MeritRecordDao _meritRecordDao;
  MeritRecordDao get meritRecordDao => _meritRecordDao;

  Future<void> open() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = path.join(databasesPath, 'first_station.db');
    _db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    _meritRecordDao = MeritRecordDao(_db);
  }

  void _onCreate(Database db, int version) async {
    await MeritRecordDao.createTable(db);
  }

}
