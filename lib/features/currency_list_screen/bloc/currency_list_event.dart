part of 'currency_list_bloc.dart';

@immutable
abstract class CurrencyListEvent {}

class LoadCurrencyList extends CurrencyListEvent {
  final Completer? completer;

  LoadCurrencyList({
    this.completer
  });

}
