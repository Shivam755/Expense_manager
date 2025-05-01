import 'dart:core';
import 'package:expense_manager/data/models/base_table.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/itransactions_db_manager.dart';
import 'package:expense_manager/data/services/database/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:expense_manager/data/models/transaction.dart';

class TransactionsDbManager implements ITransactionsDbManager {


  @override
  void createTable(Database db) {
    db.execute('''
      CREATE TABLE ${TransactionModel.tableName} (
        ${BaseTable.idColumn} TEXT NOT NULL PRIMARY KEY,
        ${TransactionModel.senderIdColumn} TEXT NOT NULL,
        ${TransactionModel.receiverIdColumn} TEXT NOT NULL,
        ${TransactionModel.descriptionColumn} TEXT,
        ${TransactionModel.amountColumn} INTEGER NOT NULL,
        ${TransactionModel.isExpenseColumn} INTEGER NOT NULL,
        ${TransactionModel.transactionDateColumn} INTEGER NOT NULL,
        ${BaseTable.createdDateColumn} INTEGER NOT NULL,
        ${BaseTable.modifiedDateColumn} INTEGER NOT NULL,
        FOREIGN KEY (${TransactionModel.senderIdColumn}) REFERENCES counter_party (id),
        FOREIGN KEY (${TransactionModel.receiverIdColumn}) REFERENCES counter_party (id)
      )
    ''');
  }

  @override
  Future insert(TransactionModel obj) async {
    Database db = await DatabaseService.instance.getDatabase();

    await db.insert(
      TransactionModel.tableName,
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<TransactionModel>> fetchAllOrderedByDateTimeDesc() async {
    Database db = await DatabaseService.instance.getDatabase();
    return (await db.query(TransactionModel.tableName,
            orderBy: '${TransactionModel.transactionDateColumn} DESC'))
        .toList()
        .map((element) => TransactionModel.fromMap(element))
        .toList();
  }
}
