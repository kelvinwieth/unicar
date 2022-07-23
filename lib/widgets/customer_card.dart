import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:unicar/cubits/customers/customers_cubit.dart';
import 'package:unicar/models/customer.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;

  const CustomerCard({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
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
              customer.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Initicon(
              text: customer.name,
              backgroundColor: Colors.blueGrey,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onTap: () {
                    final cubit = BlocProvider.of<CustomersCubit>(context);
                    cubit.startEdition(customer);
                  },
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onTap: () {
                    final cubit = BlocProvider.of<CustomersCubit>(context);
                    cubit.removeCustomer(customer);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
