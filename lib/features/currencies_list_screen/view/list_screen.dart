import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CurrenciesListScreen extends StatefulWidget {
  const CurrenciesListScreen({super.key});

  @override
  State<CurrenciesListScreen> createState() => _CurrenciesListScreenState();
}

class _CurrenciesListScreenState extends State<CurrenciesListScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies List'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      // вместо builder - separated, так будет разделитель
      body: ListView.separated(
        // если не указать, то будет бесконечно
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const currencyName = 'Rouble';
          return const CurrencyTile(currencyName: currencyName);
        },
      ),
    );
  }
}

