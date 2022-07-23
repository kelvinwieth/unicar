import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicar/commom/widgets/price_form_field.dart';
import 'package:unicar/features/cars/cubits/cars_cubit.dart';
import 'package:unicar/features/cars/models/car.dart';

class CarForm extends StatefulWidget {
  final Car? car;

  const CarForm({
    Key? key,
    this.car,
  }) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final currencyFormatter = NumberFormat.simpleCurrency();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.car != null;
    var car = isEditing
        ? widget.car!
        : Car(
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
                Text(
                  '${isEditing ? 'Atualizar' : 'Adicionar'} carro',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: car.title,
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
                PriceFormField(
                  initialValue: isEditing ? car.price : null,
                  validator: validate,
                  onSaved: (value) {
                    final price = value!.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim();
                    car.price = double.tryParse(price) ?? 0;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: car.photo,
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

                  if (isEditing) {
                    cubit.updateCar(car);
                  } else {
                    cubit.addCar(car);
                  }
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
