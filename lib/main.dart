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
        // билдеру надо передавать контекст и индекс, а после стрелки - что он будет билдить
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'lib/assets/svg/USD.svg',
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          title: Text(
            'Dollar',
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
              '/currency'
            );
          },
        ),
      ),
    );
  }
}

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dollar'),
        centerTitle: true,
      ),
    );
  }
}
