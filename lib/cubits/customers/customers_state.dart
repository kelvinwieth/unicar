import 'package:equatable/equatable.dart';
import 'package:unicar/models/customer.dart';

abstract class CustomersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CustomersInitialState extends CustomersState {}

class CustomersLoadingState extends CustomersState {}

class CustomersLoadedState extends CustomersState {
  final List<Customer> customers;

  CustomersLoadedState(this.customers);

  @override
  List<Object?> get props => [customers];
}

class CreatingCustomerState extends CustomersState {}

class EditingCustomerState extends CustomersState {
  final Customer customer;

  EditingCustomerState(this.customer);
}

class CustomersErrorState extends CustomersState {
  final String message;

  CustomersErrorState(this.message);
}
