import 'package:equatable/equatable.dart';

sealed class GetCountryEvent extends Equatable{
  const GetCountryEvent();
}

final class SearchCountryByNameEvent extends GetCountryEvent{
  const SearchCountryByNameEvent({required this.name});
  final String name;
  
  @override
  List<Object?> get props => [name];
}