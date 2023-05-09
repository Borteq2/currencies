import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositories/repositories.dart';

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc(this.currencyRepository) : super(CurrencyInitial()) {
    on<CurrencyLoad>((event, emit) async {
      try {
        emit(CurrencyLoading());
        final currency = await currencyRepository.getCurrency(event.args);
        emit(CurrencyLoaded(currency: currency));
      } catch (e, st) {
        emit(CurrencyLoadingFailed(exception: e));
        GetIt.I<Talker>().handle(e, st, 'Oops at currency_bloc.dart');
      } finally {}
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }

  final AbstractCurrencyRepository currencyRepository;
}
