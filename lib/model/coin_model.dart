class CoinModel {
  final String name;
  final String price;
  final String currency;
  final String imageUrl;

  CoinModel({
    required this.name,
    required this.price,
    required this.currency,
    required this.imageUrl,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      name: json["FROMSYMBOL"],
      price: json["PRICE"],
      currency: json["TOSYMBOL"],
      imageUrl: "https://www.cryptocompare.com${json["IMAGEURL"]}",
    );
  }
}