import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.name,
    required this.fullName,
    required this.priceInRoubles,
    required this.prev,
    required this.currencyInRoubles,
  });

  final String name;
  final String fullName;
  final double priceInRoubles;
  final double prev;
  final double currencyInRoubles;

  @override
  List<Object> get props => [name, fullName, priceInRoubles, prev];
}
