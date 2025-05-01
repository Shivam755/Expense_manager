import 'package:sqflite/sqflite.dart';
import 'package:expense_manager/data/enums/counter_party_type.dart';
import 'package:expense_manager/data/models/counter_party.dart';

abstract class ICounterPartyDbManager {
  void createTable(Database db);
  Future insert(CounterParty obj);
  Future<CounterParty> get(double id);
  Future<List<CounterParty>> getAll();
  Future<List<CounterParty>> getByType(CounterPartyType type);
}
