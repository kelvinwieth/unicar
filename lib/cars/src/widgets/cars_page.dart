import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cars/src/cubits/cars_cubit.dart';
import 'package:unicar/cars/src/cubits/cars_state.dart';
import 'package:unicar/cars/src/widgets/cars_screen.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsCubit, CarsState>(
      builder: (context, state) {
        if (state is CarsInitialState) {
          var cubit = BlocProvider.of<CarsCubit>(context);
          cubit.getAll();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CarsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CarsLoaded) {
          return CarsScreen(cars: state.cars);
        }

        if (state is CarsLoadFailed) {
          return Center(
            child: Text(state.message),
          );
        }

        return Container();
      },
    );
  }
}
