import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/customers/cubit/customers_state.dart';
import 'package:unicar/features/customers/models/customer.dart';
import 'package:unicar/features/customers/repositories/customer_repository.dart';

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

  void startEdition(Customer customer) {
    emit(EditingCustomerState(customer));
  }

  void addCustomer(Customer customer) async {
    try {
      var success = await _repository.add(customer);
      if (success) {
        _loadCustomers();
        return;
      }
    } finally {
      emit(CustomersErrorState("Erro ao adicionar cliente. Tente novamente."));
    }
  }

  void updateCustomer(Customer customer) async {
    try {
      var success = await _repository.update(customer);
      if (success) {
        _loadCustomers();
        return;
      }
    } finally {
      emit(CustomersErrorState("Erro ao atualizar cliente. Tente novamente."));
    }
  }

  void removeCustomer(Customer customer) async {
    try {
      var success = await _repository.remove(customer);
      if (success) {
        _loadCustomers();
        return;
      }
    } finally {
      emit(CustomersErrorState("Erro ao remover cliente. Tente novamente."));
    }
  }

  void cancelCreation() {
    emit(CustomersLoadedState(_lastCustomers));
  }
}
