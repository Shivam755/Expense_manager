import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'package:expense_manager/data/models/transaction.dart';

abstract class ITransactionsDbManager {
  void createTable(Database db);
  Future insert(TransactionModel obj);
  Future<List<TransactionModel>> fetchAllOrderedByDateTimeDesc();
}
