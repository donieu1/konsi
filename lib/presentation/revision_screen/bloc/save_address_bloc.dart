import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:desafio/data/models/cep_model.dart';
import 'package:desafio/data/repositories/hive_repository/hive_repository.dart';
import 'package:get_it/get_it.dart';

part 'save_address_event.dart';
part 'save_address_state.dart';

class SaveAddressBloc extends Bloc<SaveAddressEvent, SaveAddressState> {
  final HiveRepository _hiveRepository = GetIt.I<HiveRepository>();

  List<CepModel?> _allAddresses = [];

  SaveAddressBloc() : super(SaveAddressInitial()) {
    on<SaveAddressInStorageEvent>(_saveAddress);
    on<GetAddressInStorageEvent>(_getAddress);
    on<SearchAddressEvent>(_searchAddress);
    on<DeleteAddressEvent>(_deleteAddress);
  }

  Future<void> _saveAddress(
      SaveAddressInStorageEvent event, Emitter<SaveAddressState> emit) async {
    try {
      emit(SaveAddressLoading());
      await _hiveRepository.saveAddress(cepModel: event.cepModel);
      emit(SaveAddressLoaded(cepModel: event.cepModel));
    } catch (e) {
      emit(SaveAddressErro(msg: 'Erro ao salvar o endereço: ${e.toString()}'));
    }
  }

  Future<void> _getAddress(
      GetAddressInStorageEvent event, Emitter<SaveAddressState> emit) async {
    try {
      emit(SaveAddressLoading());

      _allAddresses = await _hiveRepository.getAddress();
      emit(GetAddressLoaded(cepModel: _allAddresses));
    } catch (e) {
      emit(SaveAddressErro(
          msg: 'Erro ao recuperar o endereço: ${e.toString()}'));
    }
  }

  Future<void> _searchAddress(
      SearchAddressEvent event, Emitter<SaveAddressState> emit) async {
    final searchTerm = event.query.toLowerCase();

    final filteredAddresses = _allAddresses.where((address) {
      return address?.cep?.toLowerCase().contains(searchTerm) ?? false;
    }).toList();

    emit(GetAddressLoaded(cepModel: filteredAddresses));
  }

  FutureOr<void> _deleteAddress(
      DeleteAddressEvent event, Emitter<SaveAddressState> emit) async {
    try {
      emit(SaveAddressLoading());
      await _hiveRepository.deleteAddress(event.cepModel);
      emit(DeleteSucess());
    } catch (e) {
      emit(SaveAddressErro(msg: 'Erro ao deletar o endereço'));
    }
  }
}
