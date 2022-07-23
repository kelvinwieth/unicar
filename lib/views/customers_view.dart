import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/customers/customers_cubit.dart';
import 'package:unicar/cubits/customers/customers_state.dart';
import 'package:unicar/widgets/customer_card.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersCubit, CustomersState>(
      builder: (context, state) {
        if (state is CustomersLoadedState) {
          final customers = state.customers;

          return Scaffold(
            body: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return CustomerCard(customer: customer);
              },
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
