import 'package:flutter/material.dart';
import 'package:unicar/models/car.dart';

class CarsView extends StatefulWidget {
  const CarsView({
    Key? key,
  }) : super(key: key);

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  List<Car> _cars = [];

  void loadVehicles() async {
    await Future.delayed(const Duration(seconds: 3));
    _cars = [
      Car(
        title: 'Argo 1.0 Automático',
        brand: 'Chevrolet',
        price: 45000,
        photo: 'photo',
      ),
    ];

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    loadVehicles();

    return Center(
      child: Text('${_cars.length} carros foram carregados'),
    );
  }
}
