part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  CurrencyLoaded({
    required this.currency
  });

  final Currency currency;
}

class CurrencyLoadingFailed extends CurrencyState {
  CurrencyLoadingFailed({
    required this.exception
  });

  final Object exception;

}
