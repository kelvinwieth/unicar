import 'package:uuid/uuid.dart';

class Car {
  String id;
  String title;
  double price;
  String photo;

  Car({
    required this.title,
    required this.price,
    required this.photo,
  }) : id = const Uuid().v1();
}
