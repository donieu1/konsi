import 'package:desafio/data/models/cep_model.dart';

abstract class HiveRepository {
  Future<void> saveAddress({required CepModel cepModel});
  Future<List<CepModel?>> getAddress();
  Future<void> deleteAddress(CepModel cepModel);
}
