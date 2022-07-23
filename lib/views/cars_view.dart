import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/cubits/cars_state.dart';
import 'package:unicar/utils/uni_theme.dart';
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
          return Scaffold(
            body: Form(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório.';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    final cubit = BlocProvider.of<CarsCubit>(context);
                    cubit.finishCreation();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: UniTheme.roundCancelButtonDecoration,
                    child: const Icon(Icons.close),
                  ),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () {
                    final cubit = BlocProvider.of<CarsCubit>(context);
                    cubit.finishCreation();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: UniTheme.roundConfirmButtonDecoration,
                    child: const Icon(Icons.done),
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: Text('Opa'),
        );
      },
    );
  }
}
