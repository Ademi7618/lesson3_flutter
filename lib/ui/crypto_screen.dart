import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/bloc1/crypto_bloc.dart';
import 'package:lesson02_flutter/bloc1/crypto_event.dart';
import 'package:lesson02_flutter/bloc1/crypto_state.dart';

class CryptoScreen extends StatelessWidget {
  final CryptoBloc bloc;

  const CryptoScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto Prices")),
      body: BlocProvider.value(
        value: bloc..add(LoadCoinsEvent()),
        child: BlocBuilder<CryptoBloc, CryptoState>(
          builder: (context, state) {
            if (state is CryptoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CryptoLoaded) {
              final coins = state.coins;
              return ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  final coin = coins[index];
                  return ListTile(
                    leading: Image.network(coin.imageUrl, width: 40),
                    title: Text(coin.name),
                    subtitle: Text("${coin.price} ${coin.currency}"),
                  );
                },
              );
            } else if (state is CryptoError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}