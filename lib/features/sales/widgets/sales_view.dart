import 'package:flutter/material.dart';
import 'package:unicar/features/sales/models/sale.dart';

class SalesView extends StatefulWidget {
  const SalesView({
    Key? key,
  }) : super(key: key);

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  List<Sale> _sales = [];

  void loadSales() async {
    await Future.delayed(const Duration(seconds: 1));
    _sales = [
      Sale(customer: 'Foo', car: 'BMW M5', price: 25000),
      Sale(customer: 'Bar', car: 'BMW X9', price: 22000),
    ];

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    loadSales();

    return Center(
      child: Text('${_sales.length} vendas foram carregadas'),
    );
  }
}
