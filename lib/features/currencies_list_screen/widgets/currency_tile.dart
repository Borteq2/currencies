import 'package:flutter/material.dart';
import 'currency_tile_picture.dart';

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({
    super.key,
    required this.currencyName,
  });

  final String currencyName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: currencyTilePicture(currencyName: currencyName),
      title: Text(
        currencyName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '20000 P',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // билдер передает контекст в результат стрелки
        Navigator.of(context).pushNamed(
          '/currency',
          arguments: currencyName,
        );
      },
    );
  }
}

