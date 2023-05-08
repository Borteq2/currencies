import '../features/currencies_list_screen/currencies_list.dart';
import '../features/currency_single_screen/currency_single_screen.dart';

final routes = {
  '/': (context) => const CurrenciesListScreen(),
  '/currency': (context) => const CurrencyScreen(),
};