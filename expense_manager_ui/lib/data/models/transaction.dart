import 'base_table.dart';

class TransactionModel extends BaseTable{
  String description;
  double senderId;
  double receiverId;
  double amount;
  DateTime transactionDate;
  bool isExpense;
  static const String tableName = "transactions";
  static const String senderIdColumn = "sender_id";
  static const String receiverIdColumn = "receiver_id";
  static const String descriptionColumn = "description";
  static const String amountColumn = "amount";
  static const String isExpenseColumn = "is_expense";
  static const String transactionDateColumn = "transaction_date";

  TransactionModel({
    required this.description,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.transactionDate,
    this.isExpense = false
  }) : super();

  factory TransactionModel.fromMap(Map<String, Object?> map) {
    TransactionModel transaction = TransactionModel(
      description: map[descriptionColumn] as String,
      senderId:map[senderIdColumn] as double,
      receiverId: map[receiverIdColumn] as double,
      amount: map[amountColumn] as double,
      transactionDate: DateTime.fromMillisecondsSinceEpoch(map[transactionDateColumn] as int)
    );
    transaction.id = map[BaseTable.idColumn] as double;
    transaction.isExpense = map[isExpenseColumn] as bool;
    transaction.createdDate = DateTime.fromMillisecondsSinceEpoch(map[BaseTable.createdDateColumn] as int);
    transaction.modifiedDate = DateTime.fromMillisecondsSinceEpoch(map[BaseTable.modifiedDateColumn] as int);
    return transaction;
  }

  @override
  Map<String, Object> toMap(){
    return {
      BaseTable.idColumn: id,
      descriptionColumn: description,
      amountColumn: amount,
      senderIdColumn: senderId,
      receiverIdColumn: receiverId,
      isExpenseColumn: isExpense,
      transactionDateColumn: transactionDate.millisecondsSinceEpoch,
      BaseTable.createdDateColumn: createdDate.millisecondsSinceEpoch,
      BaseTable.modifiedDateColumn: modifiedDate.millisecondsSinceEpoch
    };
  }
}