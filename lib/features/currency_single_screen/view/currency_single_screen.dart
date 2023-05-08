import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String? currencyName;

  @override
  void didChangeDependencies() {
    // объект для получения аргументов из настроек контекста
    final args = ModalRoute.of(context)?.settings.arguments;

    assert(args != null && args is String, 'You must provide String args');

    currencyName = args as String?;

    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currencyName ?? '...'),
        centerTitle: true,
      ),
    );
  }
}