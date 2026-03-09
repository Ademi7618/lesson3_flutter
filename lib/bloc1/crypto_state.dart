import 'package:equatable/equatable.dart';
import 'package:lesson02_flutter/model/coin_model.dart';


abstract class CryptoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoLoading extends CryptoState {}

class CryptoLoaded extends CryptoState {
  final List<CoinModel> coins;

  CryptoLoaded(this.coins);

  @override
  List<Object?> get props => [coins];
}

class CryptoError extends CryptoState {
  final String message;

  CryptoError(this.message);

  @override
  List<Object?> get props => [message];
}