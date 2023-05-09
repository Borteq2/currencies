part of 'currency_list_bloc.dart';

@immutable
abstract class CurrencyListState extends Equatable{}

// наследование от equatable требует оверрайда метода получения пропсов
// если у класса их нет - то можно возвращать пустой список

class CurrencyListInitial extends CurrencyListState {
  @override
  List<Object?> get props => [];
}

class CurrencyListLoading extends CurrencyListState {
  @override
  List<Object?> get props => [];

}

class CurrencyListLoaded extends CurrencyListState {
  final List<Currency> currencyList;

  CurrencyListLoaded({
    required this.currencyList
  });

  // currency также в equatable,
  // поэтому под капотом будет сравниваться поэлементно
  @override
  List<Object?> get props => [currencyList];
}

class CurrencyListLoadingFailed extends CurrencyListState {
  CurrencyListLoadingFailed({
    this.exception
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
