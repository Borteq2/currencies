import 'package:Currencies/features/crypto_list_screen/bloc/crypto_list_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'theme/myDarkTheme.dart';
import 'router/router.dart';

class CurrenciesListApp extends StatelessWidget {
  const CurrenciesListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoListScreenBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myDarkTheme,
        routes: routes,
        navigatorObservers: [
          TalkerRouteObserver(GetIt.I<Talker>())
        ],
      ),
    );
  }
}