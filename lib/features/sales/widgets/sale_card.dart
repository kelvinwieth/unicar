import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/sales/cubit/sales_cubit.dart';
import 'package:unicar/features/sales/models/sale.dart';

class SaleCard extends StatelessWidget {
  final Sale sale;

  const SaleCard({
    Key? key,
    required this.sale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: GestureDetector(
        onTap: () {
          final cubit = BlocProvider.of<SalesCubit>(context);
          cubit.startEdition(sale);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.blueGrey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              title: Text(
                sale.car,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onTap: () {
                      final cubit = BlocProvider.of<SalesCubit>(context);
                      cubit.removeSale(sale);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
