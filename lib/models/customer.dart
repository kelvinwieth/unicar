import 'package:uuid/uuid.dart';

class Customer {
  String id;
  String name;

  Customer({
    required this.name,
  }) : id = const Uuid().v1();
}
