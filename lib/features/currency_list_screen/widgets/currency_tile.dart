
import 'package:flutter/material.dart';
import '../../../repositories/models/currency_model.dart';
import 'currency_price_value_picture.dart';


class CurrencyTile extends StatelessWidget {
  const CurrencyTile({
    super.key,
    required this.currency,
  });

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      // leading: currencyTilePicture(currencyName: currency.name),
      leading: CurrencyTilePicture(currency: currency),
      title: Text(
        currency.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        ' Today: ${currency.priceInRoubles} ₽\n Yesterday: ${currency.prev} ₽',
        style: theme.textTheme.labelSmall,
      ),


      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // билдер передает контекст в результат стрелки
        Navigator.of(context).pushNamed(
          '/currency',
          arguments: currency,
        );
      },
    );
  }
}

