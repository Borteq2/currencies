import 'models/models.dart';

abstract class AbstractCurrencyRepository {
  Future<List<Currency>> getCurrencyList();
  Future<Currency> getCurrency(Currency args);
}

