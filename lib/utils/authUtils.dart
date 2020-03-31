import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const KEY_NAME = 'ACCESS_TOKEN';

class AuthUtils {
  FlutterSecureStorage flutterSecureStorage;
  AuthUtils() {
    flutterSecureStorage = FlutterSecureStorage();
  }
  Future<void> writeSecureToken(String accessToken) async {
    await flutterSecureStorage.write(key: KEY_NAME, value: accessToken);
  }

  Future<String> readSecureToken() async {
    final String accessToken = await flutterSecureStorage.read(key: KEY_NAME);
    return accessToken;
  }

  Future<void> removeSecureToken() async {
    await flutterSecureStorage.delete(key: KEY_NAME);
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
