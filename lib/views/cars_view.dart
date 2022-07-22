import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/cubits/cars_state.dart';
import 'package:unicar/widgets/car_card.dart';

class CarsView extends StatelessWidget {
  const CarsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsCubit, CarsState>(
      builder: (context, state) {
        if (state is CarsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CarsLoadedState) {
          final cars = state.cars;
          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return CarCard(car: car);
            },
          );
        }

        return const Center(
          child: Text('Opa'),
        );
      },
    );
  }
}
