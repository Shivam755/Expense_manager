import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:expense_manager/data/services/injection_container.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/icounter_party_db_manager.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/itransactions_db_manager.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> getDatabase() async {
    final databaseDirectory = await getDatabasesPath();
    final databasePath = join(databaseDirectory, "master_db.db");

    // get databases queries
    final ITransactionsDbManager transactionProvider =
        locator<ITransactionsDbManager>();
    final ICounterPartyDbManager counterPartyProvider =
        locator<ICounterPartyDbManager>();
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        switch (version) {
          case 1:
            // Creating Tables
            transactionProvider.createTable(db);
            counterPartyProvider.createTable(db);
        }
      },
    );

    return database;
  }
}
