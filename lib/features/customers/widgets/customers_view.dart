import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/commom/widgets/floating_add_button.dart';
import 'package:unicar/features/customers/cubit/customers_cubit.dart';
import 'package:unicar/features/customers/cubit/customers_state.dart';
import 'package:unicar/features/customers/widgets/customer_card.dart';
import 'package:unicar/features/customers/widgets/customer_form.dart';

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
            floatingActionButton: FloatingAddButton(
              onPressed: () {
                final cubit = BlocProvider.of<CustomersCubit>(context);
                cubit.startCreation();
              },
            ),
          );
        }

        if (state is CreatingCustomerState) {
          return const CustomerForm();
        }

        if (state is EditingCustomerState) {
          return CustomerForm(customer: state.customer);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
