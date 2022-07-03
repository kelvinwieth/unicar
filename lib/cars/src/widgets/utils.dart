import 'package:flutter/material.dart';
import 'package:unicar/cars/src/cubits/cars_cubit.dart';
import 'package:unicar/cars/src/models/car.dart';
import 'package:unicar/cars/src/widgets/car_form.dart';

void showEditCarDialog(BuildContext context, CarsCubit carsCubit, {Car? car}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: CarForm(cubit: carsCubit, car: car),
    ),
  );
}

void showDeleteCarDialog(BuildContext context, CarsCubit carsCubit, Car car) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Excluir carro ${car.description}?',
              style: const TextStyle(fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('OK'),
                  onPressed: () {
                    try {
                      carsCubit.removeCar(car);
                      Navigator.pop(context);
                    } catch (e) {
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
