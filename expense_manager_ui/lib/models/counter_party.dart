import 'package:expense_manager_ui/enums/counter_party_role.dart';
import 'package:expense_manager_ui/enums/counter_party_type.dart';
import 'base_table.dart';

class CounterParty extends BaseTable{
  String name = "";
  String description = "";
  CounterPartyRole role = CounterPartyRole.both;
  CounterPartyType type = CounterPartyType.temporary;
  bool isActive = false;
  bool maintainBalance = false;
  double balance = 0;

  CounterParty({
    required this.name,
    this.description="",
    this.role=CounterPartyRole.both,
    this.type=CounterPartyType.temporary,
    this.isActive=true,
    this.maintainBalance=false,
    this.balance=0
  }) : super();

  factory CounterParty.fromMap(Map<String, Object?> map) {
    CounterParty party = CounterParty(name: map['name'] as String);
    party.id = map['id'] as double;
    party.description = map['description'] as String;
    party.role = counterPartyRoleFromIndex(map['role'] as int);
    party.type = counterPartyTypeFromIndex(map['type'] as int);
    party.isActive = map['isActive'] as bool;
    party.maintainBalance = map['maintainBalance'] as bool;
    party.balance = map['balance'] as double;
    party.createdDate = DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int);
    party.modifiedDate = DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int);
    return party;
  }

  @override
  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'balance': balance,
      'type': type,
      'role': role,
      'isActive': isActive,
      'maintainBalance': maintainBalance,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch
    };
  }
}