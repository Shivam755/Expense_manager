import 'package:uuid/uuid.dart';

abstract class BaseTable {
  late double id;
  late DateTime createdDate;
  late DateTime modifiedDate;

  BaseTable() {
    Uuid uuid = Uuid();
    String guid = uuid.v4();
    id = double.parse(guid.replaceAll(RegExp(r'\D'), ''));
    createdDate = DateTime.now();
    modifiedDate = DateTime.now();
  }

  Map<String, Object> toMap();
}