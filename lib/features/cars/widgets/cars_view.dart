import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/cars/cubits/cars_cubit.dart';
import 'package:unicar/features/cars/cubits/cars_state.dart';
import 'package:unicar/features/cars/widgets/car_card.dart';
import 'package:unicar/features/cars/widgets/car_form.dart';
import 'package:unicar/commom/utils/uni_theme.dart';

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
          return Scaffold(
            body: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                return CarCard(car: car);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final cubit = BlocProvider.of<CarsCubit>(context);
                cubit.startCreation();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: UniTheme.circularGradientDecoration,
                child: const Icon(Icons.add),
              ),
            ),
          );
        }

        if (state is CreatingCarState) {
          return const CarForm();
        }

        if (state is EditingCarState) {
          return CarForm(car: state.car);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
