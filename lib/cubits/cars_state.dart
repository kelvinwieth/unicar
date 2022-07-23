import 'package:equatable/equatable.dart';
import 'package:unicar/models/car.dart';

abstract class CarsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarsInitialState extends CarsState {}

class CarsLoadingState extends CarsState {}

class CarsLoadedState extends CarsState {
  final List<Car> cars;

  CarsLoadedState(this.cars);

  @override
  List<Object?> get props => [cars];
}

class CreatingCarState extends CarsState {}

class CarsErrorState extends CarsState {
  final String message;

  CarsErrorState(this.message);
}
