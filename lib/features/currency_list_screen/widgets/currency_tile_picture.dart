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
      currencyName == 'Euro'
          ? 'lib/assets/svg/EURO.svg'
          : currencyName == 'Usd'
          ? 'lib/assets/svg/USD.svg'
          : currencyName == 'Rouble'
          ? 'lib/assets/svg/RUBL.svg'
          : 'unexpected',
      height: 30,
      width: 30,
    );
  }
}