import 'package:sqflite/sqflite.dart';

class DashboardProvider {
  static const String TABLE_SURVEYOR = "surveyor";
  static const String COLUMN_ID = "COLUMN_ID";
  static const String COLUMN_NAMA = "COLUMN_NAMA";
  static const String COLUMN_KOTA = "COLUMN_KOTA";
  static const String COLUMN_MEDAL = "COLUMN_MEDAL";
  static const String COLUMN_RATE = "COLUMN_RATE";
  static const String COLUMN_PHOTO = "COLUMN_PHOTO";
  static const String COLUMN_ALAMAT = "COLUMN_ALAMAT";
  static const String BERGABUNG_SEJAK = "BERGABUNG_SEJAK";

  static Future<void> createTableSurveyor(Database database) async {
    await database.execute("CREATE TABLE $TABLE_SURVEYOR ("
        "$COLUMN_ID INTEGER PRIMARY KEY,"
        "$COLUMN_NAMA TEXT,"
        "$COLUMN_KOTA TEXT,"
        "$COLUMN_MEDAL INTEGER,"
        "$COLUMN_ALAMAT TEXT,"
        "$BERGABUNG_SEJAK TEXT,"
        "$COLUMN_RATE TEXT,"
        "$COLUMN_PHOTO TEXT"
        ")");
  }
}
