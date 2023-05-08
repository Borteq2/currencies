import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_currencies_list_screen_event.dart';
part 'favorite_currencies_list_screen_state.dart';

class FavoriteCurrenciesListScreenBloc extends Bloc<FavoriteCurrenciesListScreenEvent, FavoriteCurrenciesListScreenState> {
  FavoriteCurrenciesListScreenBloc() : super(FavoriteCurrenciesListScreenInitial()) {
    on<FavoriteCurrenciesListScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
