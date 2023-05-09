
import 'package:flutter/material.dart';

import '../../../repositories/repositories.dart';
import 'currency_price_value_picture.dart';


class CurrencyTile extends StatelessWidget {
  const CurrencyTile({
    super.key,
    required this.currency,
  });

  final Currency currency;


  @override
  Widget build(BuildContext context) {

    String priceInRoubles = currency.priceInRoubles.toStringAsFixed(2);
    String prev = currency.prev.toStringAsFixed(2);

    final theme = Theme.of(context);
    return ListTile(
      // leading: currencyTilePicture(currencyName: currency.name),
      leading: CurrencyTilePriceChange(currency: currency),
      title: Text(
        currency.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        ' Today: $priceInRoubles ₽\n Yesterday: $prev ₽',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/currency',
          arguments: currency,
        );
      },
    );
  }
}

