import 'package:flutter/material.dart';
import 'theme/myDarkTheme.dart';
import 'router/router.dart';

class CurrenciesListApp extends StatelessWidget {
  const CurrenciesListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: myDarkTheme,
      routes: routes,
    );
  }
}