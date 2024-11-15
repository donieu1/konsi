import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:desafio/data/models/address_sugestion_model.dart';
import 'package:desafio/data/models/cep_model.dart';
import 'package:desafio/data/repositories/cep_repository/cep_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_bloc_event.dart';
part 'maps_bloc_state.dart';

class MapsBlocBloc extends Bloc<MapsBlocEvent, MapsBlocState> {
  final CepRepository cepRepository = GetIt.I<CepRepository>();

  MapsBlocBloc() : super(MapsBlocInitial()) {
    on<GetSuggestionsEvent>(_getSuggestions);
    on<GetLocationFromCepEvent>(_getLocationFromCep);
  }

  Future<void> _getSuggestions(
      GetSuggestionsEvent event, Emitter<MapsBlocState> emit) async {
    try {
      emit(SuggestionsLoadingState());
      final suggestions =
          await cepRepository.fetchAddressSuggestions(query: event.query);
      emit(SuggestionsLoadedState(suggestions: suggestions));
    } catch (e) {
      emit(MapsBlocErro(erro: e.toString()));
    }
  }

  Future<void> _getLocationFromCep(
      GetLocationFromCepEvent event, Emitter<MapsBlocState> emit) async {
    try {
      emit(MapsBlocLoading());
      final location = await cepRepository.searchAddress(cep: event.cep);
      final cepModel = await cepRepository.getAddress(cep: event.cep);

      if (location != null) {
        emit(MapsBlocLoaded(location: location, cepModel: cepModel));
      } else {
        emit(MapsBlocErro(erro: 'Localização não encontrada'));
      }
    } catch (e) {
      emit(MapsBlocErro(erro: e.toString()));
    }
  }
}
