import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../repositories/repositories.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc(this.currencyRepository) : super(CurrencyInitial()) {
    on<CurrencyLoad>((event, emit) async {
      try {
        emit(CurrencyLoading());

        final currency = await currencyRepository.getCurrency();
        emit(CurrencyLoaded(currency: currency));
      } catch (e) {
        emit(CurrencyLoadingFailed(exception: e));

      } finally {}
    });
  }
  final AbstractCurrencyRepository currencyRepository;
}

