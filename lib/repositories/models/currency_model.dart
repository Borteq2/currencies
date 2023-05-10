import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class Currency extends Equatable {
  const Currency({
    required this.name,
    required this.fullName,
    required this.priceInRoubles,
    required this.previous,

  });

  @JsonKey(name: 'CharCode')
  final String name;

  @JsonKey(name: 'Name')
  final String fullName;

  @JsonKey(name: 'Value')
  final double priceInRoubles;

  @JsonKey(name: 'Previous')
  final double previous;


  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  List<Object> get props => [name, fullName, priceInRoubles, previous];
}
