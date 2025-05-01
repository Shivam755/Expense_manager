import 'package:expense_manager/data/enums/counter_party_type.dart';
import 'package:expense_manager/common/widget/payee_list.dart';
import 'package:flutter/material.dart';

class PayeeHome extends StatelessWidget {
  const PayeeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs: CounterPartyType.values.map((tab) => Tab(text: tab.name)).toList(),
              labelColor: Colors.white,
              indicatorColor: Colors.white,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: CounterPartyType.values.map((tab) => PayeeList(counterPartyType: tab)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
