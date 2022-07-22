import 'package:unicar/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> getAll();
}

class CarInMemoryRepository implements CarRepository {
  final List<Car> _cars = [
    Car(
      title: 'Argo 1.0 Automático',
      brand: 'Chevrolet',
      price: 45000,
      photo: 'photo',
    ),
  ];

  @override
  Future<List<Car>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return _cars;
  }
}
