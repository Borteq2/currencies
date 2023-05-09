import 'package:flutter/material.dart';
import 'BaseCard.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    super.key,
    required this.todayPrice,
    required this.yesterdayPrice,
  });

  final String todayPrice;
  final String yesterdayPrice;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Today price', textAlign: TextAlign.left),
                  Text('Yesterday price', textAlign: TextAlign.left),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text(todayPrice), Text(yesterdayPrice)],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
