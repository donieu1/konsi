import 'package:http/http.dart';

abstract class HttpClient {
  Future<Response> get(String path, {Map<String, String>? headers});
  Future<Response> post(String path, {Map<String, dynamic>? data});
  Future<Response> patch(String path, {Map<String, dynamic>? data});
  Future<Response> put(String path, {Map<String, dynamic>? data});
  Future<Response> delete(String path, {Map<String, String>? headers});
  
}
