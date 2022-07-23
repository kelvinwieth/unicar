import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/sales/cubit/sales_cubit.dart';
import 'package:unicar/features/sales/cubit/sales_state.dart';
import 'package:unicar/features/sales/widgets/sale_card.dart';

class SalesView extends StatelessWidget {
  const SalesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      builder: (context, state) {
        if (state is SalesLoadedState) {
          return ListView.builder(
            itemCount: state.sales.length,
            itemBuilder: (context, index) {
              final sale = state.sales[index];
              return SaleCard(sale: sale);
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
