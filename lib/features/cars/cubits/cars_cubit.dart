import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/cars/cubits/cars_state.dart';
import 'package:unicar/features/cars/models/car.dart';
import 'package:unicar/features/cars/repositories/car_repository.dart';

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

  void updateCar(Car car) async {
    try {
      var success = await _repository.update(car);
      if (success) {
        _loadCars();
        return;
      }
    } finally {
      emit(CarsErrorState("Erro ao atualizar carro. Tente novamente."));
    }
  }

  void removeCar(Car car) async {
    try {
      var success = await _repository.remove(car);
      if (success) {
        _loadCars();
        return;
      }
    } finally {
      emit(CarsErrorState("Erro ao remover carro. Tente novamente."));
    }
  }

  void startEdition(Car car) {
    emit(EditingCarState(car));
  }

  void cancelCreation() {
    emit(CarsLoadedState(_lastCars));
  }
}
