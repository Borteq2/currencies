import 'package:dio/dio.dart';
import '../models/currency_model.dart';

class CurrencyRepository {
  Future<List<Currency>> getCurrencyList() async {
    String url =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=USD,EUR,USDT,BTC,DOGE&tsyms=USD,EUR,RUB';
    final response = await Dio().get(url);

    final data = response.data as Map<String, dynamic>;

    // entries отвечает за отображение всех элементов мапы в виде списка
    // мапим его для пробегания по всем строкам
    // возвращаем валюту для каждого элемента, передавая ключ в имя, а в цену -
    // каст значения, из которого берется ключ валюты
    final currencyList = data.entries
        .map((e) => Currency(
          name: e.key,
          priceInRoubles: (e.value as Map<String, dynamic>)['RUB'])
    ).toList();
    return currencyList;
  }
}
