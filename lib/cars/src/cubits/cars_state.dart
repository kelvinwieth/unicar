// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:unicar/cars/src/models/car.dart';

abstract class CarsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarsInitialState extends CarsState {}

class CarsLoading extends CarsState {}

class CarsLoaded extends CarsState {
  final List<Car> cars;

  CarsLoaded(this.cars);

  @override
  List<Object?> get props => [cars];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cars': cars.map((x) => x.toMap()).toList(),
    };
  }

  factory CarsLoaded.fromMap(Map<String, dynamic> map) {
    return CarsLoaded(
      List<Car>.from((map['cars'] as List<int>).map<Car>((x) => Car.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarsLoaded.fromJson(String source) => CarsLoaded.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CarsLoadFailed extends CarsState {
  final String message;

  CarsLoadFailed(this.message);

  @override
  List<Object?> get props => [message];
}
