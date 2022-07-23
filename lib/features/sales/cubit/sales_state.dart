import 'package:equatable/equatable.dart';
import 'package:unicar/features/sales/models/sale.dart';

abstract class SalesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SalesInitialState extends SalesState {}

class SalesLoadingState extends SalesState {}

class SalesLoadedState extends SalesState {
  final List<Sale> sales;

  SalesLoadedState(this.sales);

  @override
  List<Object?> get props => [sales];
}

class CreatingSaleState extends SalesState {}

class EditingSaleState extends SalesState {
  final Sale sale;

  EditingSaleState(this.sale);

  @override
  List<Object?> get props => [sale];
}

class SalesErrorState extends SalesState {
  final String message;

  SalesErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
