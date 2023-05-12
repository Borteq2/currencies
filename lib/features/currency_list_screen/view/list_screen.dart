import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositories/repositories.dart';
import '../../../theme/myDarkTheme.dart';
import '../bloc/currency_list_bloc.dart';
import '../widgets/widgets.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  int thisPageIndex = 2;
  final _currencyListBloc =
      CurrencyListBloc(GetIt.I<AbstractCurrencyRepository>());

  @override
  void initState() {
    // вызов эвента блока
    _currencyListBloc.add(LoadCurrencyList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Object? prevoiusIndex = ModalRoute.of(context)?.settings.arguments;

    var theme = myDarkTheme;
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          try {
            switch (prevoiusIndex) {
              case 0:
                Navigator.pushNamed(context, '/', arguments: thisPageIndex);
                break;
              case 1:
                Navigator.pushNamed(context, '/favorites',
                    arguments: thisPageIndex);
                break;
              case 2:
                Navigator.pushNamed(context, '/list', arguments: thisPageIndex);
                break;
              case 3:
                Navigator.pushNamed(context, '/crypto',
                    arguments: thisPageIndex);
                break;
              default:
                GetIt.I<Talker>().error('WRONG BOTTOM NAV INDEX');
            }
          } catch (e, st) {
            GetIt.instance<Talker>().handle(e, st);
          }

          return true; // если true, то страница закроется
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Currencies List'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TalkerScreen(
                        talker: GetIt.I<Talker>(),
                      ),
                    ));
                  },
                  icon: const Icon(Icons.document_scanner_outlined))
            ],
            // leading: const Icon(Icons.arrow_back),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              // говорит о том что асинк завершился
              final completer = Completer();
              _currencyListBloc.add(
                LoadCurrencyList(completer: completer),
              );
              return completer.future;
            },
            child: BlocBuilder<CurrencyListBloc, CurrencyListState>(
              bloc: _currencyListBloc,
              builder: (context, state) {
                if (state is CurrencyListLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: state.currencyList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      final currency = state.currencyList[i];
                      return CurrencyTile(currency: currency);
                    },
                  );
                }
                if (state is CurrencyListLoadingFailed) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Something went wrong',
                          style: theme.textTheme.headlineMedium,
                        ),
                        Text(
                          'Please try again later',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            _currencyListBloc.add(
                              LoadCurrencyList(),
                            );
                          },
                          child: const Text('Try again'),
                        )
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ));
  }
}
