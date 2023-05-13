part of 'crypto_list_screen_bloc.dart';

@immutable
abstract class CryptoListScreenEvent {}

class CryptoListScreenLoadingEvent extends CryptoListScreenEvent {
  CryptoListScreenLoadingEvent({required this.callerName});

  final String callerName;

}


