import 'package:flutter/material.dart';
import 'package:lesson02_flutter/api/crypto_api_service.dart';
import 'package:lesson02_flutter/bloc1/crypto_bloc.dart';
import 'package:lesson02_flutter/model/crypto_repository.dart';
import 'package:lesson02_flutter/ui/crypto_screen.dart';

void main() {
  final repository = CryptoRepository(CryptoApiService());
  final bloc = CryptoBloc(repository);

  runApp(MaterialApp(
    home: CryptoScreen(bloc: bloc),
  ));
}