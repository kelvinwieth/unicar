import 'package:unicar/cars/src/models/brand.dart';
import 'package:unicar/cars/src/models/car.dart';
import 'package:unicar/cars/src/models/model.dart';
import 'package:unicar/cars/src/repositories/car_repository.dart';

class LocalCarRepository implements CarRepository {
  late final List<Car> _cars;

  LocalCarRepository() {
    var bmw = Brand(name: 'BMW');
    var i320 = Model(name: '320i', brand: bmw);
    _cars = [
      Car(model: i320, price: 45000, photoUrl: 'https://imgur.com/eNGLTSG.png'),
      Car(model: i320, price: 49000, photoUrl: 'https://imgur.com/qzkbLwP.png'),
      Car(model: i320, price: 45000, photoUrl: 'https://imgur.com/VIYYPC5.png'),
    ];
  }

  @override
  Future add(Car car) {
    _cars.add(car);
    return Future.value();
  }

  @override
  Future<List<Car>> getAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return _cars;
  }

  @override
  Future<Brand?> getBrand(String name) {
    try {
      final brand = _cars.firstWhere((c) => c.model.brand.name == name).model.brand;
      return Future.value(brand);
    } catch (e) {
      return Future.value(null);
    }
  }

  @override
  Future<Model?> getModel(String name) {
    try {
      final model = _cars.firstWhere((c) => c.model.name == name).model;
      return Future.value(model);
    } catch (e) {
      return Future.value(null);
    }
  }

  @override
  Future remove(Car car) {
    _cars.remove(car);
    return Future.value();
  }
}
