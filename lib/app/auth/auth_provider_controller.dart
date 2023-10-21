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

  late Logger _logger;

  bool loggedIn = false;

  void logout() async {
    await _authService.logout();
    loggedIn = false;
    notifyListeners();
  }

  Future login(String username, String password) async {
    try {
      await _authService.login(username, password);
      loggedIn = true;

    } catch (ex, st) {
      _logger.e("login() failed!", ex, st);
      rethrow;
    }

    notifyListeners();
  }

  void checkLoginState() {
    loggedIn = _authService.loggedIn();
    notifyListeners();
  }
}
