import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'currency_list_app.dart';
import 'repositories/repositories.dart';

void main() {
  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);
  GetIt.instance<Talker>().debug('Talker started...');

  final dio = Dio();
  dio.interceptors.add(TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      )));

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: false,
        printEventFullData: false,
      ));

  GetIt.I.registerLazySingleton<AbstractCurrencyRepository>(
      () => CurrencyRepository(dio: dio));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const CurrenciesListApp()),
      (error, stack) => GetIt.I<Talker>().handle(error, stack));
}
