import '../features/currency_list_screen/currency_list.dart';
import '../features/currency_single_screen/currency_single_screen.dart';

final routes = {
  '/': (context) => const CurrencyListScreen(),
  '/currency': (context) => const CurrencyScreen(),
};