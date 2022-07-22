import 'package:flutter/material.dart';
import 'package:unicar/models/customer.dart';

class CustomersView extends StatefulWidget {
  const CustomersView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  List<Customer> _customers = [];

  void loadCustomers() async {
    await Future.delayed(const Duration(seconds: 2));
    _customers = [
      Customer(name: 'Foo'),
      Customer(name: 'Bar'),
    ];

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    loadCustomers();

    return Center(
      child: Text('${_customers.length} clientes foram carregados'),
    );
  }
}
