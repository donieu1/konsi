import 'dart:convert';

import 'package:desafio/data/clients/http_client_impl.dart';
import 'package:desafio/data/models/address_sugestion_model.dart';
import 'package:desafio/data/models/cep_model.dart';
import 'package:desafio/data/repositories/cep_repository/cep_repository.dart';
import 'package:desafio/utils/konsi_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final http = HttpClientImpl();

class CepRepositoryImpl implements CepRepository {
  final apiKey = dotenv.env['API_KEY'];
  @override
  Future<CepModel> getAddress({required String cep}) async {
    try {
      final response = await http.get("https://viacep.com.br/ws/$cep/json");

      if (response.statusCode == 200) {
        final cepModel = CepModel.fromMap(json.decode(response.body));
        return cepModel;
      } else {
        throw Exception('Falha na requisição: ${response.statusCode}');
      }
    } catch (e) {
      print("Erro ao buscar o CEP: $e");
      throw Exception('Erro ao buscar o CEP: $e');
    }
  }

  @override
  Future<LatLng?> searchAddress({required String cep}) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$cep&key=$apiKey';

    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        if (json['status'] == 'OK') {
          final location = json['results'][0]['geometry']['location'];
          final lat = location['lat'];
          final lng = location['lng'];
          return LatLng(lat, lng);
        } else {
          throw Exception('Erro na geocodificação: ${json['status']}');
        }
      } else {
        throw Exception('Falha na requisição: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar o endereço: $e');
      return null;
    }
  }

  @override
  Future<List<AddressSuggestion>> fetchAddressSuggestions(
      {required String query}) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=geocode&components=country:BR&key=$apiKey';

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'OK') {
          List<AddressSuggestion> suggestions = [];
          for (var prediction in data['predictions']) {
            final description = prediction['description'];

            String? cep = KonsiUtils.extractCepFromDescription(description);

            if (cep != null) {
              suggestions
                  .add(AddressSuggestion(cep: cep, description: description));
            }
          }
          return suggestions;
        } else {
          throw Exception('Erro ao buscar sugestões: ${data['status']}');
        }
      } else {
        throw Exception('Falha na requisição: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar sugestões de endereço: $e');
      return [];
    }
  }
}
