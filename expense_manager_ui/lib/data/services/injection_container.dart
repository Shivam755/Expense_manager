import 'package:get_it/get_it.dart';
import 'package:expense_manager/data/services/database/database_manager/counter_party_provider.dart';
import 'package:expense_manager/data/services/database/database_manager/transactions_db_manager.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/icounter_party_db_manager.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/itransactions_db_manager.dart';

final locator = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  locator.registerSingleton<ICounterPartyDbManager>(CounterPartyDbManager());
  locator.registerSingleton<ITransactionsDbManager>(TransactionsDbManager());
}
