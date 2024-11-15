part of 'maps_bloc_bloc.dart';

abstract class MapsBlocState {}

class MapsBlocInitial extends MapsBlocState {}

class MapsBlocLoading extends MapsBlocState {}

class SuggestionsLoadedState extends MapsBlocState {
  final List<AddressSuggestion> suggestions;
  SuggestionsLoadedState({required this.suggestions});
}


class SuggestionsLoadingState extends MapsBlocState {
 
}

class MapsBlocLoaded extends MapsBlocState {
  final LatLng location;
   CepModel cepModel;
  MapsBlocLoaded({required this.location, required this.cepModel});
}

class MapsBlocErro extends MapsBlocState {
  final String erro;
  MapsBlocErro({required this.erro});
}
