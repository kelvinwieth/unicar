import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_state.dart';
import 'package:unicar/models/car.dart';
import 'package:unicar/repositories/car_repository.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository _repository;
  List<Car> _lastCars = [];

  CarsCubit(this._repository) : super(CarsInitialState()) {
    _loadCars();
  }

  void _loadCars() async {
    emit(CarsLoadingState());
    try {
      var cars = await _repository.getAll();
      emit(CarsLoadedState(cars));
      _lastCars = cars;
    } catch (e) {
      emit(CarsErrorState("Falha ao carregar carros. Tente novamente."));
    }
  }

  void startCreation() {
    emit(CreatingCarState());
  }

  void addCar(Car car) async {
    try {
      var success = await _repository.add(car);
      if (success) {
        _loadCars();
        return;
      }
    } finally {
      emit(CarsErrorState("Erro ao adicionar carro. Tente novamente."));
    }
  }

  void cancelCreation() {
    emit(CarsLoadedState(_lastCars));
  }
}
