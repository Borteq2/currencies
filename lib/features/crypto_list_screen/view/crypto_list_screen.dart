import 'package:Currencies/features/crypto_list_screen/bloc/crypto_list_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListScreenBloc, CryptoListScreenState>(
      builder: (context, state) {
        CryptoListScreenState currentState =
            context.read<CryptoListScreenBloc>().state;
        String? msg;

        msg = currentState is CryptoListScreenInitial
            ? msg = 'Initial'
            : currentState is CryptoListScreenLoading
                ? msg = 'Loading'
                : currentState is CryptoListScreenLoaded
                    ? msg = 'Loaded'
                    : msg = 'WRONG STATE';

        if (state is CryptoListScreenLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('CRYPTO LIST PAGE'),
                const Text('WORK IN PROGRESS'),
                const SizedBox(height: 15),
                const Icon(Icons.construction, color: Colors.yellow),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    context.read<CryptoListScreenBloc>().add(
                          CryptoListScreenLoadingEvent(
                              callerName: runtimeType.toString()),
                        );
                  },
                  child: Text(msg),
                ),
                Visibility(
                  visible: (currentState is CryptoListScreenLoaded),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CryptoListScreenBloc>().add(
                            CryptoListScreenLoadingEvent(
                              callerName: runtimeType.toString(),
                            ),
                          );
                    },
                    child: Text('что я здесь делаю?'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
