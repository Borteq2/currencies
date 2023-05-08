import 'package:flutter/material.dart';
import '../../../repositories/currency/currency_repository.dart';
import '../widgets/widgets.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.get_app),
          onPressed: () {
            CurrencyRepository().getCurrencyList();
          }),
    );
  }
}
