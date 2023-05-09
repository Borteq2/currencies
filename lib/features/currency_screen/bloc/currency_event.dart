part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent {}

class CurrencyLoad extends CurrencyEvent {
  final Currency args;

  CurrencyLoad({
    required this.args
  });
}

