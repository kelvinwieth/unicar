import 'package:unicar/features/sales/models/sale.dart';

abstract class SaleRepository {
  Future<List<Sale>> getAll();

  Future<bool> add(Sale customer);

  Future<bool> update(Sale customer);

  Future<bool> remove(Sale customer);
}

class SaleInMemoryRepository implements SaleRepository {
  final List<Sale> _sales = [
    Sale(car: 'Carro 1', customer: 'Cliente 1', price: 1000000),
    Sale(car: 'Carro 2', customer: 'Cliente 2', price: 200000),
    Sale(car: 'Carro 3', customer: 'Cliente 3', price: 30000),
    Sale(car: 'Carro 4', customer: 'Cliente 3', price: 10000000),
  ];

  @override
  Future<List<Sale>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return _sales;
  }

  @override
  Future<bool> add(Sale sale) async {
    await Future.delayed(const Duration(seconds: 1));
    _sales.add(sale);
    return true;
  }

  @override
  Future<bool> update(Sale sale) async {
    try {
      var sourceSale = _sales.firstWhere((c) => c.id == sale.id);

      sourceSale.car = sale.car;
      sourceSale.customer = sale.customer;
      sourceSale.price = sale.price;

      return true;
    } on StateError {
      return false;
    }
  }

  @override
  Future<bool> remove(Sale sale) async {
    _sales.remove(sale);
    return true;
  }
}
