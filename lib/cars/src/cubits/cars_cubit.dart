import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:unicar/cars/src/cubits/cars_state.dart';
import 'package:unicar/cars/src/models/brand.dart';
import 'package:unicar/cars/src/models/car.dart';
import 'package:unicar/cars/src/models/model.dart';
import 'package:unicar/cars/src/repositories/car_repository.dart';

class CarsCubit extends HydratedCubit<CarsState> {
  final CarRepository repository;

  CarsCubit({required this.repository}) : super(CarsInitialState());

  void getAll() async {
    emit(CarsLoading());
    try {
      var cars = await repository.getAll();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsLoadFailed("Falha ao carregar os carros. Tente novamente."));
    }
  }

  void addCar({
    required String modelName,
    required String brandName,
    required String photoUrl,
    required double price,
    int ports = 4,
    bool isAutomatic = true,
  }) async {
    try {
      final brand = await repository.getBrand(brandName) ?? Brand(name: brandName);
      final model = await repository.getModel(modelName) ?? Model(name: modelName, brand: brand);
      final car = Car(model: model, price: price, photoUrl: photoUrl);
      repository.add(car);
      getAll();
    } catch (e) {
      emit(CarsLoadFailed("Falha ao adicionar carro. Tente novamente."));
    }
  }

  void removeCar(Car car) async {
    try {
      repository.remove(car);
      getAll();
    } catch (e) {
      emit(CarsLoadFailed("Falha ao adicionar carro. Tente novamente."));
    }
  }

  @override
  CarsState? fromJson(Map<String, dynamic> json) {
    try {
      return CarsLoaded.fromMap(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(CarsState state) {
    if (state is CarsLoaded) {
      return state.toMap();
    }

    return null;
  }
}
