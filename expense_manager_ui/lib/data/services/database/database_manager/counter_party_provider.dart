import 'package:expense_manager/data/models/base_table.dart';
import 'package:expense_manager/data/enums/counter_party_type.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/icounter_party_db_manager.dart';
import 'package:sqflite/sqflite.dart';

import 'package:expense_manager/data/models/counter_party.dart';
import 'package:expense_manager/data/services/database/database_service.dart';

class CounterPartyDbManager implements ICounterPartyDbManager {

  @override
  void createTable(Database db) {
    db.execute('''
      CREATE TABLE ${CounterParty.tableName} (
        ${BaseTable.idColumn} TEXT NOT NULL PRIMARY KEY,
        ${CounterParty.nameColumn} TEXT NOT NULL,
        ${CounterParty.descriptionColumn} TEXT NOT NULL,
        ${CounterParty.balanceColumn} INTEGER NOT NULL,
        ${CounterParty.partyTypeColumn} INTEGER NOT NULL,
        ${CounterParty.partyRoleColumn} INTEGER NOT NULL,
        ${CounterParty.isActiveColumn} NUMEMRIC NOT NULL,
        ${CounterParty.maintainBalanceColumn} NUMERIC NOT NULL,
        ${BaseTable.createdDateColumn} INTEGER NOT NULL,
        ${BaseTable.modifiedDateColumn} INTEGER NOT NULL
      )
    ''');
  }

  @override
  Future insert(CounterParty obj) async {
    Database db = await DatabaseService.instance.getDatabase();
    await db.insert(CounterParty.tableName, obj.toMap());
  }

  @override
  Future<CounterParty> get(double id) async {
    Database db = await DatabaseService.instance.getDatabase();

    return CounterParty.fromMap(
      (await db.query(CounterParty.tableName, where: '${BaseTable.idColumn} = ?', whereArgs: [id]))[0],
    );
  }

  @override
  Future<List<CounterParty>> getAll() async {
    Database db = await DatabaseService.instance.getDatabase();

    return (await db.query(CounterParty.tableName))
        .toList()
        .map((element) => CounterParty.fromMap(element))
        .toList();
  }

  @override
  Future<List<CounterParty>> getByType(CounterPartyType type) async {
    Database db = await DatabaseService.instance.getDatabase();
    return (await db.query(CounterParty.tableName, where: '${CounterParty.partyTypeColumn} = ?', whereArgs: [type.index]))
        .toList()
        .map((element) => CounterParty.fromMap(element))
        .toList();
  }
}
