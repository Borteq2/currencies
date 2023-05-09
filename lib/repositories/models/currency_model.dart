import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.name,
    required this.fullName,
    required this.priceInRoubles,
    required this.prev,
  });

  final String name;
  final String fullName;
  final dynamic priceInRoubles;
  final dynamic prev;

  @override
  List<Object> get props => [name, fullName, priceInRoubles, prev];
}
