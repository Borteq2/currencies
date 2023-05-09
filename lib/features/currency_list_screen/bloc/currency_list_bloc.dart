import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
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
        } catch (e, st) {
          emit(CurrencyListLoadingFailed(exception: e));
          GetIt.I<Talker>().handle(e, st, 'Oops at currency_list_bloc.dart');
        } finally {
          event.completer?.complete();
        }
      },
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }

  final AbstractCurrencyRepository currencyRepository;
}
