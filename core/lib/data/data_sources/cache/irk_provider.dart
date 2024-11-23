import 'package:sqflite/sqflite.dart';

class IrkProvider {
  static const String TABLE_IRK = "irk";
  static const String COLUMN_ID = "COLUMN_ID";
  static const String COLUMN_NAMA = "COLUMN_NAMA";
  static const String COLUMN_LOKASI_TANAH = "COLUMN_LOKASI_TANAH";
  static const String COLUMN_STATUS = "COLUMN_STATUS";
  static const String COLUMN_LUAS = "COLUMN_LUAS";
  static const String COLUMN_HAK_TANAH = "COLUMN_HAK_TANAH";
  static const String COLUMN_LIVE_FINISH = "COLUMN_LIVE_FINISH";
  static const String COLUMN_DITERUSKAN_PENGAWAS = "COLUMN_DITERUSKAN_PENGAWAS";
  static const String COLUMN_TABS = "COLUMN_TABS";

  static Future<void> createTableIrk(Database database) async {
    await database.execute("CREATE TABLE $TABLE_IRK ("
        "$COLUMN_ID INTEGER PRIMARY KEY,"
        "$COLUMN_NAMA TEXT,"
        "$COLUMN_LOKASI_TANAH TEXT,"
        "$COLUMN_HAK_TANAH TEXT,"
        "$COLUMN_STATUS INTEGER,"
        "$COLUMN_DITERUSKAN_PENGAWAS INTEGER,"
        "$COLUMN_LIVE_FINISH INTEGER,"
        "$COLUMN_TABS INTEGER,"
        "$COLUMN_LUAS INTEGER"
        ")");
  }
}
