import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dashboard_provider.dart';
import 'irk_provider.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await createDatabase();

    return _database!;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPath, 'getsurvey.db'), version: 2,
        onCreate: (Database database, int version) async {
      await IrkProvider.createTableIrk(database);
      await DashboardProvider.createTableSurveyor(database);
    }, onUpgrade: (Database database, oldVersion, newVersion) async {
      if (oldVersion == 1) {
        await IrkProvider.createTableIrk(database);
        oldVersion++;
      }
    });
  }
}
