import 'package:unicar/cars/src/models/brand.dart';
import 'package:unicar/cars/src/models/car.dart';
import 'package:unicar/cars/src/models/model.dart';

abstract class CarRepository {
  Future add(Car car);

  Future<List<Car>> getAll();

  Future<Brand?> getBrand(String name);

  Future<Model?> getModel(String name);

  Future remove(Car car);
}
