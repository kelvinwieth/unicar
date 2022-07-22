import 'package:flutter/material.dart';
import 'package:unicar/views/cars_view.dart';
import 'package:unicar/views/customers_view.dart';
import 'package:unicar/views/sales_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('unicar'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.blueAccent,
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: 'Carros',
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                text: 'Clientes',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Vendas',
                icon: Icon(Icons.monetization_on_rounded),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildView('Carros'),
            buildView('Clientes'),
            buildView('Vendas'),
          ],
        ),
      ),
    );
  }

  Widget buildView(String name) {
    if (name == 'Carros') {
      return const CarsView();
    }

    if (name == 'Clientes') {
      return const CustomersView();
    }

    if (name == 'Vendas') {
      return const SalesView();
    }

    return Container();
  }
}
