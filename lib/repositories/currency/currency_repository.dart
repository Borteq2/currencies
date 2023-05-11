import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../abstract_currency_repository.dart';
import '../models/currency_model.dart';

class CurrencyRepository implements AbstractCurrencyRepository {
  CurrencyRepository({
    required this.currencyBox,
    required this.dio,
  });

  final Dio dio;
  final Box<Currency> currencyBox;

  @override
  Future<List<Currency>> getCurrencyList() async {
    var currencyList = <Currency>[];
    String url = 'https://www.cbr-xml-daily.ru/daily_json.js';

    try {
      currencyList = await _fetchCurrencyListFromApi(url);
      final currencyMap = {for (var e in currencyList) e.name: e};
      await currencyBox.putAll(currencyMap);
    } catch (e, st) {

      GetIt.I<Talker>().handle(e, st);
      return currencyBox.values.toList();
    }
    return currencyList;
  }

  Future<List<Currency>> _fetchCurrencyListFromApi(String url) async {
    final response = await dio.get(url);
    final data = jsonDecode(response.data)['Valute'] as Map<String, dynamic>;

    // entries отвечает за отображение всех элементов мапы в виде списка
    // мапим его для пробегания по всем строкам
    // возвращаем валюту для каждого элемента, передавая ключ в имя, а в цену -
    // каст значения, из которого берется ключ валюты

    // объявление списка пробегает мапой по всем вхождениям,
    // на каждой итерации возвращает Currency и пополняет список аппэндом
    final currencyList = data.entries.map((e) {
      var values = (e.value as Map<String, dynamic>);

      final fullName = values['Name'];
      final nominal = values['Nominal'];
      var priceInRoubles = values['Value'];
      var previous = values['Previous'];

      if (nominal != 1) {
        priceInRoubles = priceInRoubles / nominal;
        previous = previous / nominal;
      }

      return Currency(
        name: e.key,
        fullName: fullName,
        priceInRoubles: priceInRoubles,
        previous: previous,
      );
    }).toList();
    return currencyList;
  }

  @override
  Future<Currency> getCurrency(args) async {
    final currency = Currency(
      name: args.name,
      fullName: args.fullName,
      priceInRoubles: args.priceInRoubles,
      previous: args.previous,
    );
    return currency;
  }
}
