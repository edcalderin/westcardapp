import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:westcardapp/global.dart';

abstract class BaseAuthRepository {
  Future<int> hasToken(String accessToken);
  Future<dynamic> signIn(String email, String password);
  Future<dynamic> signUp(String email, String password);
  Future<int> signOut(String email);
}

class AuthRepository extends BaseAuthRepository {
  @override
  Future<int> hasToken(String accessToken) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final String url = '${BASE_URL}api/auth/token';
        final Map<String, String> _headers = {
          'Authorization': 'Bearer $accessToken'
        };
        final response = await http.get(url, headers: _headers);
        final int statusCode = response.statusCode;
        return statusCode;
      } else
        return -1;
    } catch (e) {
      throw new Exception(e);
    }
  }

  @override
  Future<int> signIn(String email, String password) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final String url = '${BASE_URL}api/auth/token';
        final Map<String, String> _body = {
          'email': email,
          'password': password
        };
        final response = await http.post(url, body: _body);
        final int statusCode = response.statusCode;
        return statusCode;
      } else
        return null;
    } catch (e) {
      throw new Exception(e);
    }
  }

  @override
  Future<int> signOut(String email) {
    try {
      final String url = '${BASE_URL}api/auth/signout';
    } catch (e) {
      throw new Exception(e);
    }
  }

  @override
  Future<dynamic> signUp(String email, String password) {
    try {
      final String url = '${BASE_URL}api/account/signup';
    } catch (e) {
      throw new Exception(e);
    }
  }
}
