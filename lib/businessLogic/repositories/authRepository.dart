import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:westcardapp/businessLogic/utils/authUtils.dart';
import 'package:westcardapp/businessLogic/utils/common.dart';
import 'package:westcardapp/global.dart';

abstract class BaseAuthRepository {
  Future<int> hasToken(String accessToken);
  Future<dynamic> signIn(String email, String password);
  Future<dynamic> signUp(String email, String password);
  Future<dynamic> signOut(String email, String accessToken);
}

class AuthRepository extends BaseAuthRepository {
  final Common common = Common();
  final AuthUtils authUtils = AuthUtils();
  @override
  Future<int> hasToken(String accessToken) async {
    try {
      final bool isConnected = await common.checkConnection();
      if (isConnected) {
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
  Future<dynamic> signIn(String email, String password) async {
    try {
      final bool isConnected = await common.checkConnection();
      if (isConnected) {
        final String passSha512 = authUtils.convertToSha512(password);
        final String url = '${BASE_URL}api/auth/signin';
        final Map<String, String> _headers = {
          'content-type': 'application/json'
        };
        final Map<String, String> _body = {
          'email': email,
          'password': passSha512
        };
        final response =
            await http.post(url, headers: _headers, body: jsonEncode(_body));
        return response;
      } else
        return -1;
    } catch (e) {
      throw new Exception(e);
    }
  }

  @override
  Future<dynamic> signOut(String email, String accessToken) async {
    try {
      final bool isConnected = await common.checkConnection();
      if (isConnected) {
        final String url = '${BASE_URL}api/auth/signout';
        final Map<String, String> _headers = {
          'content-type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        };
        final Map<String, String> _body = {
          'email': email,
        };
        final response = await http.post(url, headers: _headers, body: _body);
        final int statusCode = response.statusCode;
        return statusCode;
      } else
        return -1;
    } catch (e) {
      throw new Exception(e);
    }
  }

  @override
  Future<dynamic> signUp(String email, String password) async {
    try {
      final bool isConnected = await common.checkConnection();
      if (isConnected) {
        final String passSha512 = authUtils.convertToSha512(password);
        final String url = '${BASE_URL}api/account/signup';
        final Map<String, String> _headers = {
          'content-type': 'application/json'
        };
        final Map<String, String> _body = {
          'email': email,
          'password': passSha512
        };
        final response = await http.post(url, headers: _headers, body: _body);
      } else
        return -1;
    } catch (e) {
      throw new Exception(e);
    }
  }
}
