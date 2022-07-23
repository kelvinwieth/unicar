import 'package:flutter/material.dart';
import 'package:unicar/features/sales/models/sale.dart';

class SaleCard extends StatelessWidget {
  final Sale sale;

  const SaleCard({
    Key? key,
    required this.sale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(sale.car),
      ),
    );
  }
}
