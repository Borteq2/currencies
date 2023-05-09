import 'dart:convert';
import 'package:dio/dio.dart';
import '../abstract_currency_repository.dart';
import '../models/currency_model.dart';

class CurrencyRepository implements AbstractCurrencyRepository {
  CurrencyRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Currency>> getCurrencyList() async {
    // String url =
    //     'https://min-api.cryptocompare.com/data/pricemulti?fsyms=USD,EUR,MDL,USDT,BTC,DOGE&tsyms=RUB';
    String url = 'https://www.cbr-xml-daily.ru/daily_json.js';
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
      var prev = values['Previous'];

      if (nominal != 1) {
        priceInRoubles = priceInRoubles / nominal;
        prev = prev / nominal;
      }

      double currencyInRoubles = 1 / priceInRoubles;


      return Currency(
        name: e.key,
        fullName: fullName,
        priceInRoubles: priceInRoubles,
        prev: prev,
        currencyInRoubles: currencyInRoubles
      );
    }).toList();

    return currencyList;
  }

  @override
  Future<Currency> getCurrency(args) async {
    final currency =
        Currency(
            name: args.name,
            fullName: args.fullName,
            priceInRoubles: args.priceInRoubles,
            prev: args.prev,
            currencyInRoubles: args.currencyInRoubles,
        );
    return currency;
  }
}
