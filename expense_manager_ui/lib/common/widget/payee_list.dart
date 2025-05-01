import 'package:expense_manager/common/widget/payee_card.dart';
import 'package:expense_manager/data/enums/counter_party_type.dart';
import 'package:expense_manager/data/models/counter_party.dart';
import 'package:expense_manager/data/services/database/database_manager_interfaces/icounter_party_db_manager.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/data/services/injection_container.dart';

class PayeeList extends StatelessWidget {
  final CounterPartyType counterPartyType;
  const PayeeList({super.key, required this.counterPartyType});

  @override
  Widget build(BuildContext context) {
    ICounterPartyDbManager counterPartyProvider =
        locator<ICounterPartyDbManager>();

    return FutureBuilder<List<CounterParty>>(
      future: counterPartyProvider.getByType(counterPartyType),
      builder: (BuildContext context,
          AsyncSnapshot<List<CounterParty>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle any errors that occur during the fetch
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<CounterParty> payees = snapshot.data!;
        if (payees.length <= 0){
          return const Center(child: Text("No Payees added Yet!"));
        }
        return  ListView(
          children: payees
              .map(
                (e) => PayeeCard(
              payee: e,
            ),
          ).toList(),
        );
      },
    );
  }
}
