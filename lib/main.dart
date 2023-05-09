import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'currency_list_app.dart';
import 'repositories/repositories.dart';

void main() {

  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);
  GetIt.instance<Talker>().debug('Talker started...');

  GetIt.I.registerLazySingleton<AbstractCurrencyRepository>(
      () => CurrencyRepository(dio: Dio()));

  runApp(const CurrenciesListApp());
}
