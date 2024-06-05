import 'package:sqflite/sqflite.dart';
import 'package:sales_app/database/database_service.dart';
import 'package:sales_app/model/user.dart';

class UserDB {
  final tableName = 'user';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "email" TEXT NOT NULL,
      "password" TEXT NOT NULL,
      "username" TEXT NOT NULL,
      "created_at" INTERGER NOT NULL DEFAULT (cast(strftime('%s','now') as int)),
      "updated_at" INTERGER,
    )""");
  }

}