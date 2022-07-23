import 'package:unicar/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> getAll();

  Future<bool> add(Car car);

  Future<bool> update(Car car);

  Future<bool> remove(Car car);
}

class CarInMemoryRepository implements CarRepository {
  final List<Car> _cars = [
    Car(
      title: 'Fiat Argo 1.0 2022',
      price: 50000,
      photo: 'https://i.imgur.com/w4d9Vbkm.png',
    ),
    Car(
      title: 'Fiat Toro 1.8 2022',
      price: 150000,
      photo: 'https://i.imgur.com/2TYFeIam.png',
    ),
    Car(
      title: 'Fiat Strada 1.3 2021',
      price: 80000,
      photo: 'https://i.imgur.com/Ph0j8yim.png',
    ),
  ];

  @override
  Future<List<Car>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _cars;
  }

  @override
  Future<bool> add(Car car) async {
    await Future.delayed(const Duration(seconds: 1));
    _cars.add(car);
    return true;
  }

  @override
  Future<bool> remove(Car car) async {
    _cars.remove(car);
    return true;
  }

  @override
  Future<bool> update(Car car) async {
    try {
      var sourceCar = _cars.firstWhere((c) => c.id == car.id);

      sourceCar.title = car.title;
      sourceCar.price = car.price;
      sourceCar.photo = car.photo;

      return true;
    } on StateError {
      return false;
    }
  }
}
