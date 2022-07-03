// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:unicar/cars/src/models/brand.dart';

class Model {
  String name;
  Brand brand;

  Model({required this.name, required this.brand});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brand': brand.toMap(),
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      name: map['name'] as String,
      brand: Brand.fromMap(map['brand'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source) as Map<String, dynamic>);
}
