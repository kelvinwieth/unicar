import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_state.dart';
import 'package:unicar/repositories/car_repository.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository _repository;

  CarsCubit(this._repository) : super(CarsInitialState()) {
    _loadCars();
  }

  void _loadCars() async {
    emit(CarsLoadingState());
    try {
      var cars = await _repository.getAll();
      emit(CarsLoadedState(cars));
    } catch (e) {
      emit(CarsLoadingErrorState());
    }
  }

  void startCreation() {
    emit(CreatingCarState());
  }

  void finishCreation() {
    _loadCars();
  }
}
