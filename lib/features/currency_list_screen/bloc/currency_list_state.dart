part of 'currency_list_bloc.dart';

@immutable
abstract class CurrencyListState {}

class CurrencyListInitial extends CurrencyListState {}

class CurrencyListLoading extends CurrencyListState {

}

class CurrencyListLoaded extends CurrencyListState {
  final List<Currency> currencyList;

  CurrencyListLoaded({
    required this.currencyList
  });
}

class CurrencyListLoadingFailed extends CurrencyListState {
  CurrencyListLoadingFailed({
    this.exception
  });
  final Object? exception;
}
