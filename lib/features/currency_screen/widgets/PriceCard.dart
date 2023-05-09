import 'package:flutter/material.dart';
import 'BaseCard.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    super.key,
    required this.todayPrice,
    required this.yesterdayPrice,
  });

  final double todayPrice;
  final double yesterdayPrice;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Today price',
                  textAlign: TextAlign.left),
              Text('Yesterday price',
                  textAlign: TextAlign.left),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$todayPrice'),
              Text('$yesterdayPrice')
            ],
          )
        ],
      ),
    );
  }
}