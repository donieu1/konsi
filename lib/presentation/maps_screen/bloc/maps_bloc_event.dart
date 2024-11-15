part of 'maps_bloc_bloc.dart';

abstract class MapsBlocEvent {}

class GetSuggestionsEvent extends MapsBlocEvent {
  final String query;
  GetSuggestionsEvent({required this.query});
}

class GetLocationFromCepEvent extends MapsBlocEvent {
  final String cep;
  GetLocationFromCepEvent({required this.cep});
}

class GetMapsBlocEvent extends MapsBlocEvent {
  final String cep;
  GetMapsBlocEvent({required this.cep});
}
