import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/utils/uni_theme.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
              cubit.cancelCreation();
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
              final isValid = _formKey.currentState?.validate() ?? false;

              if (!isValid) {
                return;
              }

              final cubit = BlocProvider.of<CarsCubit>(context);
              cubit.cancelCreation();
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
}
