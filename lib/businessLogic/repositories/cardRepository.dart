import 'dart:convert';

import 'package:westcardapp/models/profileModel.dart';
import 'package:westcardapp/utils/authUtils.dart';
import 'package:http/http.dart' as http;
import '../../global.dart';

abstract class BaseCardRepository {
  Future<List<ProfileModel>> getAllCards(int uuid);
  Future<dynamic> createCard(ProfileModel profileModel);
  Future<dynamic> deleteCards(int id);
}

class CardRepository extends BaseCardRepository {
  @override
  Future<dynamic> createCard(ProfileModel profileModel) async {
    try {
      final List<String> authData = await AuthUtils().readSecureAuthData();
      final String accessToken = authData[1];
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-type': 'Application/json'
      };
      final String url = '${BASE_URL}api/profile/create/';
      final dynamic response = await http.post(url,
          headers: _headers, body: jsonEncode(profileModel));
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<dynamic> deleteCards(int id) async {
    try {
      final List<String> authData = await AuthUtils().readSecureAuthData();
      final String accessToken = authData[1];
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken',
      };
      final String url = '${BASE_URL}api/card/delete/$id';
      final dynamic response = await http.delete(url, headers: _headers);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<ProfileModel>> getAllCards(int uuid) async {
    try {
      final List<String> authData = await AuthUtils().readSecureAuthData();
      final String email = authData[0];
      final String accessToken = authData[1];
      final String url = '${BASE_URL}api/card/all';
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken'
      };
      final dynamic response = await http.get(url, headers: _headers);
      return response;
    } catch (e) {
      return null;
    }
  }
}
