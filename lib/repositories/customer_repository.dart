import 'package:unicar/models/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAll();

  Future<bool> add(Customer customer);
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

  @override
  Future<bool> add(Customer customer) async {
    await Future.delayed(const Duration(seconds: 1));
    _customers.add(customer);
    return true;
  }
}
