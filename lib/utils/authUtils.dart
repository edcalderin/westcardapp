import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const KEY_TOKEN = 'ACCESS_TOKEN';
const KEY_EMAIL = 'ACCESS_TOKEN';

class AuthUtils {
  FlutterSecureStorage flutterSecureStorage;
  AuthUtils() {
    flutterSecureStorage = FlutterSecureStorage();
  }
  Future<void> writeSecureAuthData({@required String email, @required String accessToken}) async {
    await flutterSecureStorage.write(key: KEY_TOKEN, value: accessToken);
    await flutterSecureStorage.write(key: KEY_EMAIL, value: email);
  }

  Future<List<String>> readSecureAuthData() async {
    final String email = await flutterSecureStorage.read(key: KEY_EMAIL);
    final String accessToken = await flutterSecureStorage.read(key: KEY_TOKEN);
    return [email, accessToken];
  }

  Future<void> removeSecureDataAuth() async {
    await flutterSecureStorage.deleteAll();
  }

  String convertToSha512(String plainPassword) {
    var firstChunk = utf8.encode(plainPassword);
    var output = AccumulatorSink<Digest>();
    var input = sha512.startChunkedConversion(output);
    input.add(firstChunk);
    input.close();
    var digest = output.events.single;
    return digest.toString();
  }

  bool isUsernameTaken(dynamic response) {
    if (response.statusCode == 400) {
      final dynamic body = jsonDecode(response.body);
      return body['status'] == 'error' &&
          body['message'] == 'username is already taken';
    }
    return false;
  }
}
