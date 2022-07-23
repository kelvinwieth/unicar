import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/cubits/customers/customers_cubit.dart';
import 'package:unicar/pages/home_page.dart';
import 'package:unicar/repositories/car_repository.dart';
import 'package:unicar/repositories/customer_repository.dart';

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
