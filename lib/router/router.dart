import '../features/currency_list_screen/currency_list.dart';
import '../features/currency_screen/currency_screen.dart';


final routes = {
  '/': (context) => const CurrencyListScreen(),
  '/currency': (context) => CurrencyScreen(),
};