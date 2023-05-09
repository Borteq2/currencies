import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/repositories.dart';
import '../bloc/currency_bloc.dart';

class CurrencyScreen extends StatefulWidget {
  CurrencyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _currencyBloc = CurrencyBloc(GetIt.I<AbstractCurrencyRepository>());

  @override
  void initState() {
    _currencyBloc.add(CurrencyLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
          bloc: _currencyBloc,
          builder: (context, state) {
            if (state is CurrencyLoaded) {
              return Text(state.currency.name);
            }
            if (state is CurrencyLoadingFailed) {
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
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
    );
  }
}
