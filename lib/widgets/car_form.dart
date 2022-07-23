import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/cars_cubit.dart';
import 'package:unicar/models/car.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var car = Car(
      title: '',
      price: 0,
      photo: '',
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Adicionar carro',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  validator: validate,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    labelText: 'Título do anúncio',
                    hintText: 'Uno Mille 1.0 2002',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => car.title = value!,
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
                    hintText: 'R\$ 15.000,00',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    final price = value!.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim();
                    car.price = double.tryParse(price) ?? 0;
                  },
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
                  onSaved: (value) => car.photo = value!,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                color: Colors.grey,
                icon: const Icon(Icons.close, size: 30),
                onPressed: () {
                  final cubit = BlocProvider.of<CarsCubit>(context);
                  cubit.cancelCreation();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                color: Colors.green,
                icon: const Icon(Icons.done, size: 30),
                onPressed: () {
                  final isValid = _formKey.currentState?.validate() ?? false;

                  if (!isValid) {
                    return;
                  }

                  _formKey.currentState!.save();

                  final cubit = BlocProvider.of<CarsCubit>(context);
                  cubit.addCar(car);
                },
              ),
            ),
          ],
        ),
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
