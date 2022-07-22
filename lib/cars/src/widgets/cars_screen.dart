import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cars/src/cubits/cars_cubit.dart';
import 'package:unicar/cars/src/models/car.dart';
import 'package:unicar/cars/src/widgets/car_card.dart';
import 'package:unicar/cars/src/widgets/utils.dart';

class CarsScreen extends StatelessWidget {
  final List<Car> cars;
  const CarsScreen({
    Key? key,
    required this.cars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CarsCubit>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            var car = cars[index];
            return CarCard(car: car);
          },
        ),
        // appBar: AppBar(
        //   bottom: const TabBar(
        //     indicatorWeight: 5,
        //     tabs: [
        //       Tab(
        //         icon: Icon(Icons.car_rental),
        //         text: 'Carros',
        //       ),
        //       Tab(
        //         icon: Icon(Icons.car_rental),
        //         text: 'Clientes',
        //       ),
        //       Tab(
        //         icon: Icon(Icons.car_rental),
        //         text: 'Vendas',
        //       ),
        //     ],
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 60, 84, 189),
          child: const Icon(Icons.add, size: 40),
          onPressed: () => showEditCarDialog(context, cubit),
        ),
      ),
    );
  }
}
