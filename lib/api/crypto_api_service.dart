import 'package:dio/dio.dart';
import 'package:lesson02_flutter/model/coin_model.dart';

class CryptoApiService {
  final Dio dio = Dio();

  Future<List<CoinModel>> fetchCoins() async {
    final response = await dio.get(
      "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV,LTC,BOND,BETA,WING,TWT,DOGE,FORTH,TRX,MLN,LINK,BICO,CAKE,LQTY,POND&tsyms=USD",
    );

    final Map<String, dynamic> data = response.data["DISPLAY"];

    List<CoinModel> coins = [];
    data.forEach((key, value) {
      coins.add(CoinModel.fromJson(value["USD"]));
    });

    return coins;
  }
}