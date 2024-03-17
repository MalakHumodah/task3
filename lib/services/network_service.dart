import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  String baseUrl = 'http://192.168.0.85:3000/api/';

  Map<String, String> header = {'Content-Type': 'application/json'};

  Future<http.Response> get({
    required String url,
    Map<String, String>? header,
  }) async {
    final response = await http.get(
      Uri.parse(baseUrl + url),
      headers: header,
    );
    return response;
  }

  Future<http.Response> post({
    required String url,
    Map<String, String>? header,
    required Object body,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl + url),
      body: body,
      headers: header ?? this.header,
    );
    return response;
  }

  Future<http.Response> delete({
    required String url,
    Map<String, String>? header,
  }) async {
    final response = await http.delete(
      Uri.parse(baseUrl + url),
      headers: header,
    );
    return response;
  }

  Future<http.Response> put({
    required String url,
    Map<String, String>? header,
    required Object body,
  }) async {
    final response = await http.put(
      Uri.parse(baseUrl + url),
      headers: header,
      body: body,
    );
    return response;
  }
}
