import 'package:expense_manager/data/models/counter_party.dart';
import 'package:flutter/material.dart';

class PayeeCard extends StatelessWidget {
  final CounterParty payee;
  const PayeeCard({super.key, required this.payee});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                payee.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                payee.partyType.name,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
