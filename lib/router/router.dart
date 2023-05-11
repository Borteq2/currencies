import 'package:Currencies/features/main_screen/main_screen.dart';

import '../features/currency_list_screen/currency_list.dart';
import '../features/currency_screen/currency_screen.dart';
import '../features/home_screen/home_screen.dart';


final routes = {
  '/': (context) => MainScreen(),
  '/home': (context) => const HomePageScreen(),
  '/list': (context) => const CurrencyListScreen(),
  '/currency': (context) => const CurrencyScreen(),
};