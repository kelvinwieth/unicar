// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:unicar/cars/src/models/model.dart';

class Car {
  Model model;
  double price;
  String photoUrl;
  bool automatic;
  int doors;

  Car({
    required this.model,
    required this.price,
    required this.photoUrl,
    this.automatic = true,
    this.doors = 4,
  });

  String get _automatic => automatic ? 'Automático' : 'Manual';

  String get description => '${model.brand.name} ${model.name} $_automatic ${doors}P';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'model': model.toMap(),
      'price': price,
      'photoUrl': photoUrl,
      'automatic': automatic,
      'doors': doors,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      model: Model.fromMap(map['model'] as Map<String, dynamic>),
      price: map['price'] as double,
      photoUrl: map['photoUrl'] as String,
      automatic: map['automatic'] as bool,
      doors: map['doors'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source) as Map<String, dynamic>);
}
