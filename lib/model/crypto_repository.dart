import 'package:lesson02_flutter/api/crypto_api_service.dart';
import 'package:lesson02_flutter/model/coin_model.dart';

class CryptoRepository {
  final CryptoApiService api;

  CryptoRepository(this.api);

  Future<List<CoinModel>> getCoins() => api.fetchCoins();
}