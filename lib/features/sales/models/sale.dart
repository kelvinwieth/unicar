import 'package:uuid/uuid.dart';

class Sale {
  String id;
  String customer;
  String car;
  double price;

  Sale({
    required this.customer,
    required this.car,
    required this.price,
  }) : id = const Uuid().v1();
}
