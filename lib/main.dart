import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'currency_list_app.dart';
import 'repositories/currency/currency.dart';
import 'repositories/repositories.dart';



void main() {
  // регистрация синглтона по типу абстракта с реализацией конкретного репозитория
  GetIt.I.registerLazySingleton<AbstractCurrencyRepository>(() => CurrencyRepository(dio: Dio()));
  runApp(const CurrenciesListApp());
}
