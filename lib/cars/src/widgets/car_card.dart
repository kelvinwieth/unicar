import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cars/src/cubits/cars_cubit.dart';
import 'package:unicar/cars/src/models/car.dart';
import 'package:unicar/cars/src/widgets/utils.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CarsCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      car.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      child: const Icon(Icons.edit),
                      onPressed: () => showEditCarDialog(context, cubit, car: car),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      child: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => showDeleteCarDialog(context, cubit, car),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'R\$ ${car.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 60, 84, 189),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.network(car.photoUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
