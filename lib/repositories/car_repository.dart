import 'package:unicar/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> getAll();
}

class CarInMemoryRepository implements CarRepository {
  final List<Car> _cars = [
    Car(
      title: 'Fiat Argo 1.0 Automático',
      price: 50000,
      photo: 'https://i.imgur.com/w4d9Vbkm.png',
    ),
    Car(
      title: 'Fiat Toro 1.8 Automático',
      price: 150000,
      photo: 'https://i.imgur.com/2TYFeIam.png',
    ),
    Car(
      title: 'Fiat Strada 1.3 Manual',
      price: 80000,
      photo: 'https://i.imgur.com/Ph0j8yim.png',
    ),
  ];

  @override
  Future<List<Car>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _cars;
  }
}
