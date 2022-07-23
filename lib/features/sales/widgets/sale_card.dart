import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicar/commom/themes/uni_colors.dart';
import 'package:unicar/commom/widgets/subtitled_icon.dart';
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
    final currencyFormatter = NumberFormat.simpleCurrency();

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
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    SubtitledIcon(
                      subtitle: sale.car,
                      icon: Icons.directions_car,
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    SubtitledIcon(
                      subtitle: currencyFormatter.format(sale.price),
                      icon: Icons.sell,
                      width: 100,
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    SubtitledIcon(
                      subtitle: sale.customer,
                      icon: Icons.person,
                    ),
                  ],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.delete,
                      color: UniColors.recycleBin,
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
