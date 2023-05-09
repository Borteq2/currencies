import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/repositories.dart';
import '../../currency_list_screen/widgets/currency_price_value_picture.dart';
import '../bloc/currency_bloc.dart';
import '../widgets/widgets.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _currencyBloc = CurrencyBloc(GetIt.I<AbstractCurrencyRepository>());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Currency;
    _currencyBloc.add(CurrencyLoad(args: args));
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
          bloc: _currencyBloc,
          builder: (context, state) {
            if (state is CurrencyLoaded) {
              String currencyName = state.currency.name;
              String currencyFullName = state.currency.fullName.toUpperCase();
              String todayPrice =
                  state.currency.priceInRoubles.toStringAsFixed(2);
              String yesterdayPrice = state.currency.prev.toStringAsFixed(2);
              String currencyInRoubles =
                  state.currency.currencyInRoubles.toStringAsFixed(2);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Text(
                            currencyName,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CurrencyTilePriceChange(currency: state.currency),
                    ),
                    const SizedBox(height: 24),
                    BaseCard(
                      child: Text(
                        currencyFullName,
                        style: theme.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    PriceCard(
                      todayPrice: todayPrice,
                      yesterdayPrice: yesterdayPrice,
                    ),
                    BaseCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Roubles per unit:'),
                          Text(currencyInRoubles),
                        ],
                      ),
                    )
                  ],
                ),
              );
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
