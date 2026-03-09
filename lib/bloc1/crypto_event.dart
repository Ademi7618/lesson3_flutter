import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCoinsEvent extends CryptoEvent {}