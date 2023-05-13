part of 'crypto_list_screen_bloc.dart';

@immutable
abstract class CryptoListScreenState {}

class CryptoListScreenInitial extends CryptoListScreenState {}

class CryptoListScreenLoading extends CryptoListScreenState {
  CryptoListScreenLoading({required this.message});

  final String message;
}

class CryptoListScreenLoaded extends CryptoListScreenState {
  CryptoListScreenLoaded({required this.message});

  final String message;
}

class CryptoListScreenLoadingFailed extends CryptoListScreenState {}
