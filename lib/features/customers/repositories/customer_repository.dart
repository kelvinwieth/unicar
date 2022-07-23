import 'package:unicar/features/customers/models/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAll();

  Future<bool> add(Customer customer);

  Future<bool> update(Customer customer);

  Future<bool> remove(Customer customer);
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

  @override
  Future<bool> update(Customer customer) async {
    try {
      var sourceCustomer = _customers.firstWhere((c) => c.id == customer.id);
      sourceCustomer.name = customer.name;
      return true;
    } on StateError {
      return false;
    }
  }

  @override
  Future<bool> remove(Customer customer) async {
    _customers.remove(customer);
    return true;
  }
}
