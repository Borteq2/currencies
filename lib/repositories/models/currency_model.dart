import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Currency extends Equatable {
  const Currency({
    required this.name,
    required this.fullName,
    required this.priceInRoubles,
    required this.previous,

  });

  @HiveField(0)
  @JsonKey(name: 'CharCode')
  final String name;

  @HiveField(1)
  @JsonKey(name: 'Name')
  final String fullName;

  @HiveField(2)
  @JsonKey(name: 'Value')
  final double priceInRoubles;

  @HiveField(3)
  @JsonKey(name: 'Previous')
  final double previous;

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  List<Object> get props => [name, fullName, priceInRoubles, previous];
}
