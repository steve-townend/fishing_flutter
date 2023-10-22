import 'package:_app_framework/app/auth/auth_data.dart';
import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_services/api_service.dart';
import 'package:_app_framework/common_services/auth_service.dart';
import 'package:_app_framework/common_services/logging_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AuthProviderController extends ChangeNotifier {
  AuthProviderController() {
    loggedIn = _authService.loggedIn();
    _logger = _loggingService.getLogger(this);
  }

  final _authService = getIt.get<AuthService>();
  final _loggingService = getIt.get<LoggingService>();
  final _apiService = getIt.get<ApiService>();

  late Logger _logger;

  bool loggedIn = false;

  void logout() async {
    await _authService.logout();
    loggedIn = false;
    notifyListeners();
  }

  Future<String> login(String username, String password) async {
    try {

      Map body = {
        "username": username,
        "password": password,
      };

      var authData = (await _apiService.fetchPostData(API_AUTHENTICATE, body, authDataFromJson)) as AuthData;

      await _authService.saveToken(authData.token);
      loggedIn = true;

      notifyListeners();

      return "${authData.firstName} ${authData.lastName} ";

    } catch (ex, st) {
      _logger.e("login() failed!", ex, st);
      rethrow;
    }

  }

  void checkLoginState() {
    loggedIn = _authService.loggedIn();
    notifyListeners();
  }
}
