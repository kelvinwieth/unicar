import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unicar/cars/src/cubits/cars_cubit.dart';
import 'package:unicar/cars/src/repositories/local_car_repository.dart';
import 'package:unicar/cars/src/widgets/cars_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const Unicar()),
    storage: storage,
  );
}

class Unicar extends StatelessWidget {
  const Unicar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (_) => CarsCubit(repository: LocalCarRepository()),
          child: const CarsPage(),
        ),
      ),
    );
  }
}
