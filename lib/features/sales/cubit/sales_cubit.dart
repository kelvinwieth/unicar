import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicar/features/sales/cubit/sales_state.dart';
import 'package:unicar/features/sales/models/sale.dart';
import 'package:unicar/features/sales/repositories/sale_repository.dart';

class SalesCubit extends Cubit<SalesState> {
  final SaleRepository _repository;
  List<Sale> _lastSales = [];

  SalesCubit(this._repository) : super(SalesInitialState()) {
    _loadSales();
  }

  void _loadSales() async {
    emit(SalesLoadingState());
    try {
      var sale = await _repository.getAll();
      emit(SalesLoadedState(sale));
      _lastSales = sale;
    } catch (e) {
      emit(SalesErrorState("Falha ao carregar vendas. Tente novamente."));
    }
  }

  void startCreation() {
    emit(CreatingSaleState());
  }

  void startEdition(Sale sale) {
    emit(EditingSaleState(sale));
  }

  void addSale(Sale sale) async {
    try {
      var success = await _repository.add(sale);
      if (success) {
        _loadSales();
        return;
      }
    } finally {
      emit(SalesErrorState("Erro ao adicionar venda. Tente novamente."));
    }
  }

  void updateSale(Sale sale) async {
    try {
      var success = await _repository.update(sale);
      if (success) {
        _loadSales();
        return;
      }
    } finally {
      emit(SalesErrorState("Erro ao atualizar venda. Tente novamente."));
    }
  }

  void removeSale(Sale sale) async {
    try {
      var success = await _repository.remove(sale);
      if (success) {
        _loadSales();
        return;
      }
    } finally {
      emit(SalesErrorState("Erro ao remover venda. Tente novamente."));
    }
  }

  void cancelCreation() {
    emit(SalesLoadedState(_lastSales));
  }
}
