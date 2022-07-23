import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/customers/cubit/customers_cubit.dart';
import 'package:unicar/features/customers/models/customer.dart';

class CustomerForm extends StatefulWidget {
  final Customer? customer;

  const CustomerForm({
    Key? key,
    this.customer,
  }) : super(key: key);

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.customer != null;
    var customer = isEditing ? widget.customer! : Customer(name: '');

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
                  'Adicionar cliente',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: customer.name,
                  validator: validate,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.abc),
                    labelText: 'Nome do cliente',
                    hintText: 'João da Silva',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => customer.name = value!,
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
                  final cubit = BlocProvider.of<CustomersCubit>(context);
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

                  final cubit = BlocProvider.of<CustomersCubit>(context);

                  if (isEditing) {
                    cubit.updateCustomer(customer);
                  } else {
                    cubit.addCustomer(customer);
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
