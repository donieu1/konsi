import 'package:desafio/data/models/cep_model.dart';
import 'package:desafio/data/repositories/hive_repository/hive_repository.dart';
import 'package:desafio/domain/constants/app_constants.dart';
import 'package:hive/hive.dart';

class HiveRepositoryImpl implements HiveRepository {
  final _visuBox = Hive.box(StorageKeys.mainBox);

  @override
  Future<void> saveAddress({required CepModel cepModel}) async {
    try {
      final addresses = _visuBox.get('addresses', defaultValue: []);

      addresses.add(cepModel.toMap());

      await _visuBox.put('addresses', addresses);
    } catch (e) {
      print("Erro ao salvar endereço: $e");
      throw Exception("Erro ao salvar o endereço.");
    }
  }

  @override
  Future<List<CepModel>> getAddress() async {
    try {
      final List<dynamic> savedAddresses =
          _visuBox.get('addresses', defaultValue: []);

      return savedAddresses.map((address) {
        return CepModel.fromMap(Map<String, dynamic>.from(address));
      }).toList();
    } catch (e) {
      print("Erro ao recuperar endereços: $e");
      throw Exception("Erro ao recuperar os endereços.");
    }
  }

  @override
  Future<void> deleteAddress(CepModel cepModel) async {
    try {
      final List<dynamic> addresses =
          _visuBox.get('addresses', defaultValue: []);

      for (var address in addresses) {
        CepModel.fromMap(Map<String, dynamic>.from(address)).cep;
      }

      addresses.removeWhere((address) {
        final currentCep =
            CepModel.fromMap(Map<String, dynamic>.from(address)).cep;
        return currentCep == cepModel.cep;
      });

      await _visuBox.put('addresses', addresses);
    } catch (e) {
      throw Exception("Erro ao excluir o endereço: $e");
    }
  }
}
