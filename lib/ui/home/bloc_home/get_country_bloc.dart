import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson02_flutter/data/api_service/coutry_api_service.dart';
import 'package:lesson02_flutter/ui/home/bloc_home/get_contry_event.dart';
import 'package:lesson02_flutter/ui/home/bloc_home/get_country_state.dart';

class GetCountryBloc extends Bloc<GetCountryEvent, GetCountryState> {
  GetCountryBloc(this.apiService) : super(GetCountryInitial()) {
    on<SearchCountryByNameEvent>(_searchCountryByName);
  }

  final CoutryApiService apiService;

  Future<void> _searchCountryByName(
    SearchCountryByNameEvent event,
    Emitter<GetCountryState> emit,
  ) async {
    emit(LoadingCountryState());

    try {
      final countryModel =
          await apiService.searchCountry(name: event.name);

      emit(
        LoadedCountryState(
          countryResponseModel: countryModel,
        ),
      );
    } catch (exception, stackTrace) {
      print(exception);
      print(stackTrace);
      emit(ErrorCountryState());
    }
  }
}