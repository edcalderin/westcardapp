import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:westcardapp/utils/authUtils.dart';
import 'package:westcardapp/utils/common.dart';
import 'package:westcardapp/global.dart';

abstract class BaseAuthRepository {
  Future<int> hasToken(String accessToken);
  Future<dynamic> signIn(String email, String password);
  Future<int> signUp(String email, String password);
  Future<dynamic> signOut(String email, String accessToken);
  Future<dynamic> activateAccount(String email, String activationCode);
  Future<dynamic> forgotPassword(String email);
  Future<dynamic> resetPassword(
      String email, String resetCode, String password);
  Future<dynamic> accountStatus(String email, String token);
  Future<dynamic> newActivationCode(String email);
}

class AuthRepository extends BaseAuthRepository {
  final Common common = Common();
  final AuthUtils authUtils = AuthUtils();
  @override
  Future<int> hasToken(String accessToken) async {
    try {
      final String url = '${BASE_URL}api/auth/token';
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken'
      };
      final response = await http.get(url, headers: _headers);
      final int statusCode = response.statusCode;
      return statusCode;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<dynamic> signIn(String email, String password) async {
    try {
      final String passSha512 = authUtils.convertToSha512(password);
      final String url = '${BASE_URL}api/auth/signin';
      final Map<String, String> _headers = {'content-type': 'application/json'};
      final Map<String, String> _body = {
        'email': email,
        'password': passSha512
      };
      final response =
          await http.post(url, headers: _headers, body: jsonEncode(_body));
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<dynamic> signOut(String email, String accessToken) async {
    try {
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
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<int> signUp(String email, String password) async {
    try {
      final String passSha512 = authUtils.convertToSha512(password);
      final String url = '${BASE_URL}api/account/signup';
      final Map<String, String> _headers = {'content-type': 'application/json'};
      final Map<String, String> _body = {
        'email': email,
        'password': passSha512,
        "role": jsonEncode(['FREE_USER'].toList())
      };
      final response =
          await http.post(url, headers: _headers, body: jsonEncode(_body));
      return response.statusCode;
    } catch (e) {
      return null;
    }
  }

  @override
  Future activateAccount(String email, String activationCode) async {
    try {
      final String url = '${BASE_URL}api/account/activation';
      final Map<String, String> _headers = {'content-type': 'application/json'};
      final Map<String, String> _body = {
        'email': email,
        'activationCode': activationCode
      };
      final response = await http.post(url, headers: _headers, body: _body);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future forgotPassword(String email) async {
    try {
      final String url = '${BASE_URL}api/account/forgotpassword';
      final Map<String, String> _headers = {'content-type': 'application/json'};
      final Map<String, String> _body = {'email': email};
      final response = await http.post(url, headers: _headers, body: _body);
      return response;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future resetPassword(String email, String resetCode, String password) async {
    try {
      final String passSha512 = authUtils.convertToSha512(password);
      final String url = '${BASE_URL}api/account/resetpassword';
      final Map<String, String> _headers = {'content-type': 'application/json'};
      final Map<String, String> _body = {
        'email': email,
        'reset_code': resetCode,
        'password': passSha512
      };
      final response = await http.post(url, headers: _headers, body: _body);
      return response;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<dynamic> accountStatus(String email, String token) async {
    try {
      final String url = '${BASE_URL}api/account/status/$email';
      final Map<String, String> _headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      final response = await http.get(
        url,
        headers: _headers,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future newActivationCode(String email) {
    // TODO: implement newActivationCode
    return null;
  }
}
