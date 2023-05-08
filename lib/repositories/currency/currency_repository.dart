import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyRepository {
  Future<void> getCurrencyList() async {
    String url =
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=USD,EUR,USDT,BTC,DOGE&tsyms=USD,EUR,RUB';
    final response = await Dio().get(url);
    debugPrint((response).toString());
  }
}
