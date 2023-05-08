import 'package:flutter/material.dart';
import '../../../repositories/currency/currency_repository.dart';
import '../../../repositories/models/currency_model.dart';
import '../widgets/widgets.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  List<Currency>? _currencyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies List'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      // вместо builder - separated, так будет разделитель
      body: (_currencyList == null)
          ? const SizedBox()
          : ListView.separated(
              // если не указать, то будет бесконечно
              // !.length означает что там ТОЧНО не нул
              itemCount: _currencyList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final currency = _currencyList![i];
                return CurrencyTile(currency: currency);
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.get_app),
          onPressed: () async {
            _currencyList = await CurrencyRepository().getCurrencyList();
            setState(() {});
          }),
    );
  }
}
