import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/commom/widgets/price_form_field.dart';
import 'package:unicar/features/sales/cubit/sales_cubit.dart';
import 'package:unicar/features/sales/models/sale.dart';

class SaleForm extends StatefulWidget {
  const SaleForm({Key? key, this.sale}) : super(key: key);

  final Sale? sale;

  @override
  State<SaleForm> createState() => _SaleFormState();
}

class _SaleFormState extends State<SaleForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.sale != null;
    var sale = isEditing
        ? widget.sale!
        : Sale(
            car: '',
            customer: '',
            price: 0,
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
                  '${isEditing ? 'Atualizar' : 'Adicionar'} venda',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: sale.car,
                  validator: validate,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    labelText: 'Carro',
                    hintText: 'BMW M5 2020',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => sale.car = value!,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: sale.customer,
                  validator: validate,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    labelText: 'Cliente',
                    hintText: 'João da Silva',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => sale.customer = value!,
                ),
                const SizedBox(height: 40),
                PriceFormField(
                  initialValue: isEditing ? sale.price : null,
                  validator: validate,
                  onSaved: (value) {
                    final price = value!.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim();
                    sale.price = double.tryParse(price) ?? 0;
                  },
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
                  final cubit = BlocProvider.of<SalesCubit>(context);
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

                  final cubit = BlocProvider.of<SalesCubit>(context);

                  if (isEditing) {
                    cubit.updateSale(sale);
                  } else {
                    cubit.addSale(sale);
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
