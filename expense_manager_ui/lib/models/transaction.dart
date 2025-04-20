import 'base_table.dart';

class Transaction extends BaseTable{
  String description;
  double senderId;
  double receiverId;
  double amount;
  DateTime transactionDate;
  bool isExpense;

  Transaction({
    required this.description,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.transactionDate,
    this.isExpense = false
  }) : super();

  factory Transaction.fromMap(Map<String, Object?> map) {
    Transaction transaction = Transaction(
      description: map['description'] as String,
      senderId:map['senderId'] as double,
      receiverId: map['receiverId'] as double,
      amount: map['amount'] as double,
      transactionDate: DateTime.fromMillisecondsSinceEpoch(map['transactionDate'] as int)
    );
    transaction.id = map['id'] as double;
    transaction.isExpense = map['isExpense'] as bool;
    transaction.createdDate = DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int);
    transaction.modifiedDate = DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int);
    return transaction;
  }

  @override
  Map<String, Object> toMap(){
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'senderId': senderId,
      'receiverId': receiverId,
      'isExpense': isExpense,
      'transactionDate': transactionDate.millisecondsSinceEpoch,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch
    };
  }
}