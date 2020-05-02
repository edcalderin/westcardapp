import 'dart:convert';

import 'package:westcardapp/global.dart';
import 'package:westcardapp/models/profileModel.dart';
import 'package:http/http.dart' as http;
import 'package:westcardapp/utils/authUtils.dart';

abstract class BaseProfileRepository {
  Future<dynamic> getProfileData();
  Future<dynamic> updateProfile(ProfileModel profileModel);
  Future<dynamic> createProfile(ProfileModel profileModel);
}

class ProfileRepository extends BaseProfileRepository {
  @override
  Future<dynamic> getProfileData() async {
    try {
      final List<String> authData = await AuthUtils().readSecureAuthData();
      final String email = authData[0];
      final String accessToken = authData[1];
      final String url = '${BASE_URL}api/profile/get/$email';
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken'
      };
      final dynamic response = await http.get(url, headers: _headers);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<dynamic> updateProfile(ProfileModel profileModel) async {
    try {
      final List<String> authData = await AuthUtils().readSecureAuthData();
      final String email = authData[0];
      final String accessToken = authData[1];
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken'
      };
      final String url = '${BASE_URL}api/profile/update/';
      final dynamic response = await http.put(url, headers: _headers);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<dynamic> createProfile(ProfileModel profileModel) async {
    try {
      final List<String> authData = await AuthUtils().readSecureAuthData();
      final String accessToken = authData[1];
      final Map<String, String> _headers = {
        'Authorization': 'Bearer $accessToken'
      };
      final String url = '${BASE_URL}api/profile/create/';
      final dynamic response = await http.post(url,
          headers: _headers, body: jsonEncode(profileModel));
      return response;
    } catch (e) {
      return null;
    }
  }
}
