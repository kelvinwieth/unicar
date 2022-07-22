import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/pages/home_page.dart';
import 'package:unicar/repositories/car_repository.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(const Unicar());
}

class Unicar extends StatelessWidget {
  const Unicar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = CarInMemoryRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => BlocProvider(
              create: (context) => CarsCubit(repository),
              child: const HomePage(),
            ),
      },
    );
  }
}
