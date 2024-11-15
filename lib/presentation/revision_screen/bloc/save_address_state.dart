// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_address_bloc.dart';

abstract class SaveAddressState {}

class SaveAddressInitial extends SaveAddressState {}


class SaveAddressLoading extends SaveAddressState {}

class SaveAddressLoaded extends SaveAddressState {
  final CepModel cepModel;

  SaveAddressLoaded({required this.cepModel});
}


class DeleteSucess extends SaveAddressState {}


class GetAddressLoaded extends SaveAddressState {
  final List<CepModel?> cepModel;
  GetAddressLoaded({
    required this.cepModel,
  });
}

class SaveAddressErro extends SaveAddressState {
  final String msg;
  SaveAddressErro({
    required this.msg,
  });
}




