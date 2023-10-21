
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:localstorage/localstorage.dart';

import '../common_models/constants.dart';

class AuthService {

  late LocalStorage _storage;

  AuthService() {
    _storage = LocalStorage('fishing.json');
  }

  bool loggedIn() {

    String? token = _storage.getItem(AUTH_TOKEN_NAME);
    String _tmp = "";

    // debugPrint('AuthService.LoggedIn(), token  $token');

    if (token != null) {
      _tmp = token;
    } else {
      _tmp = "";
    }

    return _tmp == "" ? false: true;
  }

  Future<String> getToken() async {

    String? token = await _storage.getItem(AUTH_TOKEN_NAME);

    return token?? "";
  }

  Future setupStorage() async {
    // debugPrint('AuthService:setupStorage() creating LocalStorage...');
    _storage = LocalStorage('fishing.json');
    await _storage.ready;
    // debugPrint('AuthService:setupStorage() storage is ready');
  }

  Future login(String token) async {
    await _storage.setItem(AUTH_TOKEN_NAME, token);
  }

  Future logout() async {
    await _storage.deleteItem(AUTH_TOKEN_NAME);
  }


}
