import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../services/network_service.dart';

class LoginDataSource {
  NetworkService service = NetworkService();

  Future<http.Response> login({
    required Map info,
  }) async {
    String body = json.encode(info);
    final response = await service.post(
      url: 'user/login',
      body: body,
    );


    return response;
  }
}
