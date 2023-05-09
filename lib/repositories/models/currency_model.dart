import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.name,
    required this.priceInRoubles,
    required this.prev,
  });

  final String name;
  final dynamic priceInRoubles;
  final dynamic prev;

  @override
  List<Object> get props => [name, priceInRoubles, prev];
}
