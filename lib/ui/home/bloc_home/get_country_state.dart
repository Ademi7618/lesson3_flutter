import 'package:lesson02_flutter/data/model/country_response_model.dart';

abstract class GetCountryState {}

class GetCountryInitial extends GetCountryState {}

class LoadingCountryState extends GetCountryState {}

class LoadedCountryState extends GetCountryState {
  final CountryResponseModel countryResponseModel;

  LoadedCountryState({
    required this.countryResponseModel,
  });
}

class ErrorCountryState extends GetCountryState {}