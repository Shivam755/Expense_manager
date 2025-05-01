import 'package:flutter/material.dart';

class ExpenseSummary extends StatelessWidget {
  final double totalIncome;
  final double totalExpense;
  const ExpenseSummary(
      {super.key, required this.totalIncome, required this.totalExpense});

  @override
  Widget build(BuildContext context) {
    double savings = totalIncome - totalExpense;
    String currency = "₹";

    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: Text(
            "Total Balance",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            currency + savings.toString(),
            style: TextStyle(
              color: savings < 0 ? Colors.red : Colors.green,
              fontSize: 30,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Income ",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      currency + totalIncome.toString(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Expense ",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      currency + totalExpense.toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
