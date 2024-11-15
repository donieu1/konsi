part of 'save_address_bloc.dart';


abstract class SaveAddressEvent {}


class SaveAddressInStorageEvent extends SaveAddressEvent {
  final CepModel cepModel;
  SaveAddressInStorageEvent({
    required this.cepModel,
  });
}

class GetAddressInStorageEvent extends SaveAddressEvent{}

class SearchAddressEvent extends SaveAddressEvent {
  final String query;

  SearchAddressEvent(this.query);
}


class DeleteAddressEvent extends SaveAddressEvent {
  final CepModel cepModel;

  DeleteAddressEvent({required this.cepModel});
}
