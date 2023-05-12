import '../features/currency_list_screen/currency_list.dart';
import '../features/currency_screen/currency_screen.dart';
import '../features/home_screen/home_screen.dart';


final routes = {

  '/': (context) => const HomePageScreen(),
  '/list': (context) => const CurrencyListScreen(),
  '/currency': (context) => const CurrencyScreen(),
};