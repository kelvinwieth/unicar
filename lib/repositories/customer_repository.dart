import 'package:unicar/models/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAll();
}

class CustomerInMemoryRepository implements CustomerRepository {
  final List<Customer> _customers = [
    Customer(name: 'Foo'),
    Customer(name: 'Bar'),
  ];

  @override
  Future<List<Customer>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return _customers;
  }
}
