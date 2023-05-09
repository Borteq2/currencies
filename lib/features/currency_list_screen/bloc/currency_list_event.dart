part of 'currency_list_bloc.dart';

@immutable
abstract class CurrencyListEvent extends Equatable {}

class LoadCurrencyList extends CurrencyListEvent {
  final Completer? completer;

  LoadCurrencyList({
    this.completer
  });

  // защита от перезагрузки одного и того же экрана
  @override
  List<Object?> get props => [completer];
}
