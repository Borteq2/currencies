import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CurrenciesListApp());
}

class CurrenciesListApp extends StatelessWidget {
  const CurrenciesListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        dividerColor: Colors.white24,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 31, 31, 31),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/': (context) => CurrenciesListScreen(),
        '/currency': (context) => CurrencyScreen(),
      },
    );
  }
}

class CurrenciesListScreen extends StatefulWidget {
  const CurrenciesListScreen({super.key});

  @override
  State<CurrenciesListScreen> createState() => _CurrenciesListScreenState();
}

class _CurrenciesListScreenState extends State<CurrenciesListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Currencies List'),
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
          return ListTile(
            leading: SvgPicture.asset(
              currencyName == 'Euro'
                  ? 'lib/assets/svg/EURO.svg'
                  : currencyName == 'Usd'
                      ? 'lib/assets/svg/USD.svg'
                      : currencyName == 'Rouble'
                          ? 'lib/assets/svg/RUBL.svg'
                          : 'unexpected',
              height: 30,
              width: 30,
            ),
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
        },
      ),
    );
  }
}

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
