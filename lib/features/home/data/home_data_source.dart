import 'package:http/http.dart' as http;
import 'package:task3/core/constants/keys.dart';
import '../../../services/network_service.dart';
import '../../../services/shared_service.dart';

class HomeDataSource {
  NetworkService service = NetworkService();

  Future<http.Response> getInfo() async {
    String accessTokenAuth = Prefs.getString(accessTokenKey) ?? '';
    return await service
        .get(url: 'user/allUsers', header: {'auth': accessTokenAuth});
  }
}
