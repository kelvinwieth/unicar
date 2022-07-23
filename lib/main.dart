import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicar/features/cars/cubits/cars_cubit.dart';
import 'package:unicar/features/cars/repositories/car_repository.dart';
import 'package:unicar/features/customers/cubit/customers_cubit.dart';
import 'package:unicar/pages/home_page.dart';
import 'package:unicar/features/customers/repositories/customer_repository.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(const Unicar());
}

class Unicar extends StatelessWidget {
  const Unicar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carsRepository = CarInMemoryRepository();
    final customersRepository = CustomerInMemoryRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => MultiBlocProvider(
              providers: [
                BlocProvider<CarsCubit>(
                  create: (_) => CarsCubit(carsRepository),
                ),
                BlocProvider<CustomersCubit>(
                  create: (_) => CustomersCubit(customersRepository),
                ),
              ],
              child: const HomePage(),
            ),
      },
    );
  }
}
