import 'package:desafio/data/models/address_sugestion_model.dart';
import 'package:desafio/data/models/cep_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CepRepository {
Future<CepModel> getAddress({required String cep});
 Future<LatLng?> searchAddress({required String cep});
Future<List<AddressSuggestion>> fetchAddressSuggestions({required String query});

}