import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                validator: validate,
                maxLength: 30,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.abc),
                  labelText: 'Título do anúncio',
                  hintText: 'Corsa 1.0 2002 Manual',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: validate,
                maxLength: 16,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: 'pt-BR',
                    decimalDigits: 2,
                    symbol: 'R\$',
                  )
                ],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.attach_money),
                  labelText: 'Preço',
                  hintText: 'R\$ 50.000,00',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: validate,
                maxLength: 50,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.camera_alt),
                  labelText: 'Link da foto',
                  hintText: 'https://imgur.com/2TYFeIa.png',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
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

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }
}
