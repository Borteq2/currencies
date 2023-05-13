import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_screen_event.dart';
part 'crypto_list_screen_state.dart';

Talker logger = GetIt.I<Talker>();

class CryptoListScreenBloc extends Bloc<CryptoListScreenEvent, CryptoListScreenState> {
  CryptoListScreenBloc() : super(CryptoListScreenInitial()) {
    on<CryptoListScreenLoadingEvent>((event, emit) async {
      String messageAuthor = event.callerName;

      emit(CryptoListScreenLoading(message: 'Loading from $messageAuthor'));
      await doSomething();
      emit(CryptoListScreenLoaded(message: 'Loaded successfully'));

    });

  }
}

Future<void> doSomething() async {
  await Future.delayed(const Duration(seconds: 1));
  // код вашей функции
}
