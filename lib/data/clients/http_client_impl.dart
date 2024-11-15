import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class HttpClientImpl {
  final _http = http.Client();

  HttpClientImpl(); 

  Future<http.Response> _retryRequest(
    Future<http.Response> Function() requestFunction,
  ) async {
    return await retry(
      requestFunction,
      retryIf: (e) => e is SocketException || e is TimeoutException,
      maxAttempts: 3,
    );
  }

  Future<http.Response> _performRequestWithRetry(
    Future<http.Response> Function() requestFunction,
  ) async {
    try {
      final response = await _retryRequest(requestFunction);

      if (response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 404) {
        final newResponse = await _retryRequest(() => requestFunction());
        return newResponse;
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> get(String baseUrl, {Map<String, String>? headers}) async {
    final String url = baseUrl;
    return await _performRequestWithRetry(
        () => _http.get(Uri.parse(url), headers: headers));
  }

  Future<http.Response> post(String baseUrl,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    final String url = baseUrl;
    final String jsonBody = json.encode(data);
    headers = headers ?? {};
    headers['Content-Type'] = 'application/json';
    return await _performRequestWithRetry(
        () => _http.post(Uri.parse(url), body: jsonBody, headers: headers));
  }

  Future<http.Response> patch(String baseUrl,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    final String url = baseUrl;
    final String jsonBody = json.encode(data);

    headers = headers ?? {};
    headers['Content-Type'] = 'application/json';
    return await _performRequestWithRetry(
        () => _http.patch(Uri.parse(url), body: jsonBody, headers: headers));
  }

  Future<http.Response> put(String baseUrl,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    final String url = baseUrl;

    final String jsonBody = data != null ? json.encode(data) : '';

    headers = headers ?? {};
    headers['Content-Type'] = 'application/json';

    return await _performRequestWithRetry(
        () => _http.put(Uri.parse(url), body: jsonBody, headers: headers));
  }

  Future<http.Response> delete(String baseUrl,
      {Map<String, String>? headers}) async {
    final String url = baseUrl;
    return await _performRequestWithRetry(
        () => _http.delete(Uri.parse(url), headers: headers));
  }
}
