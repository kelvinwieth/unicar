import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/cubits/cars_state.dart';

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
        } else {
          return const Center(
            child: Text('Opa'),
          );
        }
      },
    );
  }
}
