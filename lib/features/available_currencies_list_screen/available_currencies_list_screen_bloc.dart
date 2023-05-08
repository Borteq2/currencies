import 'package:bloc/bloc.dart';


part 'available_currencies_list_screen_event.dart';
part 'available_currencies_list_screen_state.dart';

class AvailableCurrenciesListScreenBloc extends Bloc<AvailableCurrenciesListScreenEvent, AvailableCurrenciesListScreenState> {
  AvailableCurrenciesListScreenBloc() : super(AvailableCurrenciesListScreenInitial()) {
    on<AvailableCurrenciesListScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
