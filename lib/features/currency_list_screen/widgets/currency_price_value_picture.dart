import 'package:currency_checker/repositories/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyTilePriceChange extends StatelessWidget {
  const CurrencyTilePriceChange({
    super.key,
    required this.currency,
  });

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      currency.priceInRoubles > currency.prev
      ? 'lib/assets/svg/UP.svg'
      : 'lib/assets/svg/DOWN.svg',
      height: 30,
      width: 30,
    );
  }
}