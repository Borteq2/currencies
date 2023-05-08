import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class currencyTilePicture extends StatelessWidget {
  const currencyTilePicture({
    super.key,
    required this.currencyName,
  });

  final String currencyName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      currencyName == 'EUR'
          ? 'lib/assets/svg/EURO.svg'
          : currencyName == 'USD'
          ? 'lib/assets/svg/USD.svg'
          : currencyName == 'RUB'
          ? 'lib/assets/svg/RUB.svg'
          : 'lib/assets/svg/unexpected.svg',
      height: 30,
      width: 30,
    );
  }
}