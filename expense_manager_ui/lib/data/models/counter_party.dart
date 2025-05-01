import 'package:expense_manager/data/enums/counter_party_role.dart';
import 'package:expense_manager/data/enums/counter_party_type.dart';
import 'base_table.dart';

class CounterParty extends BaseTable{
  String name = "";
  String description = "";
  CounterPartyRole partyRole = CounterPartyRole.both;
  CounterPartyType partyType = CounterPartyType.Temporary;
  bool isActive = false;
  bool maintainBalance = false;
  double balance = 0;

  static const String tableName = "counter_party";
  static const String nameColumn = "name";
  static const String descriptionColumn = "description";
  static const String balanceColumn = "balance";
  static const String partyTypeColumn = "party_type";
  static const String partyRoleColumn = "party_role";
  static const String isActiveColumn = "is_active";
  static const String maintainBalanceColumn = "maintain_balance";

  CounterParty({
    required this.name,
    this.description="",
    this.partyRole=CounterPartyRole.both,
    this.partyType=CounterPartyType.Temporary,
    this.isActive=true,
    this.maintainBalance=false,
    this.balance=0
  }) : super();

  factory CounterParty.fromMap(Map<String, Object?> map) {
    CounterParty party = CounterParty(name: map[nameColumn] as String);
    party.id = map[BaseTable.idColumn] as double;
    party.description = map[descriptionColumn] as String;
    party.partyRole = counterPartyRoleFromIndex(map[partyRoleColumn] as int);
    party.partyType = counterPartyTypeFromIndex(map[partyRoleColumn] as int);
    party.isActive = map[isActiveColumn] as bool;
    party.maintainBalance = map[maintainBalanceColumn] as bool;
    party.balance = map[balanceColumn] as double;
    party.createdDate = DateTime.fromMillisecondsSinceEpoch(map[BaseTable.createdDateColumn] as int);
    party.modifiedDate = DateTime.fromMillisecondsSinceEpoch(map[BaseTable.modifiedDateColumn] as int);
    return party;
  }

  @override
  Map<String, Object> toMap() {
    return {
      BaseTable.idColumn: id,
      nameColumn: name,
      descriptionColumn: description,
      balanceColumn: balance,
      partyTypeColumn: partyType.index,
      partyRoleColumn: partyRole.index,
      isActiveColumn: isActive,
      maintainBalanceColumn: maintainBalance,
      BaseTable.createdDateColumn: createdDate.millisecondsSinceEpoch,
      BaseTable.modifiedDateColumn: modifiedDate.millisecondsSinceEpoch
    };
  }
}