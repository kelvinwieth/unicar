import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicar/features/cars/cubits/cars_cubit.dart';
import 'package:unicar/features/cars/models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: GestureDetector(
        onTap: () {
          final cubit = BlocProvider.of<CarsCubit>(context);
          cubit.startEdition(car);
        },
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.blueGrey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
                child: Image.network(
                  car.photo,
                  height: 100,
                  width: 90,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Icon(Icons.image);
                  },
                ),
              ),
              title: Text(
                car.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                formatCurrency.format(car.price),
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: GestureDetector(
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onTap: () {
                  final cubit = BlocProvider.of<CarsCubit>(context);
                  cubit.removeCar(car);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
