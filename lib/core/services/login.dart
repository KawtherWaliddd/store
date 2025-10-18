import 'dart:io';

import 'package:store_app/core/network/api_client.dart';
import 'package:store_app/core/network/api_config.dart';

class Login {
  Future login({required String userNmae, required String password}) async {
    try {
      await ApiClient().post(
        url: "${ApiConfig.baseUrl}${ApiConfig.login}",
        data: {"username": userNmae, "password": password},
      );
    } catch (e) {
      HandshakeException(e.toString());
    }
  }
}
