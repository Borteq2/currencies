import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../abstract_currency_repository.dart';
import '../models/currency_model.dart';

class CurrencyRepository implements AbstractCurrencyRepository{

  @override
  Future<List<Currency>> getCurrencyList() async {
    // String url =
    //     'https://min-api.cryptocompare.com/data/pricemulti?fsyms=USD,EUR,MDL,USDT,BTC,DOGE&tsyms=RUB';
    String url = 'https://www.cbr-xml-daily.ru/daily_json.js';
    final response = await Dio().get(url);
    final data = jsonDecode(response.data)['Valute'] as Map<String, dynamic>;

    // entries отвечает за отображение всех элементов мапы в виде списка
    // мапим его для пробегания по всем строкам
    // возвращаем валюту для каждого элемента, передавая ключ в имя, а в цену -
    // каст значения, из которого берется ключ валюты

    // объявление списка пробегает мапой по всем вхождениям,
    // на каждой итерации возвращает Currency и пополняет список аппэндом
    final currencyList = data.entries.map((e) {
      var values = (e.value as Map<String, dynamic>);
      final name = values['Name'];
      final nominal = values['Nominal'];
      var priceInRoubles = values['Value'];
      var prev = values['Previous'];
      log(name);

      if (nominal != 1) {
        priceInRoubles = priceInRoubles / nominal;
        prev = prev / nominal;
      }

      return Currency(
        name: e.key,
        priceInRoubles: priceInRoubles,
        prev: prev,
      );}).toList();

    return currencyList;
  }
}
