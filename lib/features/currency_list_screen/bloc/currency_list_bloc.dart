import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/repositories.dart';

part 'currency_list_event.dart';

part 'currency_list_state.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  CurrencyListBloc(this.currencyRepository) : super(CurrencyListInitial()) {
    // на событии сначала по дефолту ставит стейт загрузка, потом
    // идёт в репозиторий, гетает лист, а затем эмитит статус загружено
    on<LoadCurrencyList>(
      (event, emit) async {
        try {
          if (state is! CurrencyListLoaded) {
            emit(CurrencyListLoading());
          }
          final currencyList = await currencyRepository.getCurrencyList();
          emit(CurrencyListLoaded(currencyList: currencyList));
        } catch (e) {
          emit(CurrencyListLoadingFailed(exception: e));
        } finally {
          // если он есть, то завершить, если нет - то ничего не делать
          event.completer?.complete();
        }
      },
    );
  }

  final AbstractCurrencyRepository currencyRepository;
}
