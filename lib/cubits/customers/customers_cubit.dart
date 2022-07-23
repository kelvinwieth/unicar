import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/cubits/customers/customers_state.dart';
import 'package:unicar/models/customer.dart';
import 'package:unicar/repositories/customer_repository.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final CustomerRepository _repository;
  List<Customer> _lastCustomers = [];

  CustomersCubit(this._repository) : super(CustomersInitialState()) {
    _loadCustomers();
  }

  void _loadCustomers() async {
    emit(CustomersLoadingState());
    try {
      var customers = await _repository.getAll();
      emit(CustomersLoadedState(customers));
      _lastCustomers = customers;
    } catch (e) {
      emit(CustomersErrorState("Falha ao carregar clientes. Tente novamente."));
    }
  }

  void startCreation() {
    emit(CreatingCustomerState());
  }

  void addCustomer(Customer customer) async {
    // try {
    // var success = await _repository.add(customer);
    // if (success) {
    //   _loadCustomers();
    //   return;
    // }
    // } finally {
    //   emit(CustomersErrorState("Erro ao adicionar cliente. Tente novamente."));
    // }
  }

  void cancelCreation() {
    emit(CustomersLoadedState(_lastCustomers));
  }
}
