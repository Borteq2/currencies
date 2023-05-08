import 'models/models.dart';

abstract class AbstractCurrencyRepository {
  Future<List<Currency>> getCurrencyList();
}