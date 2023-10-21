import 'package:_app_framework/common_services/auth_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:flutter/foundation.dart';

class AuthProviderController extends ChangeNotifier {
  AuthProviderController() {
    loggedIn = _authService.loggedIn();
  }

  final _authService = getIt.get<AuthService>();

  bool loggedIn = false;

  void logout() async {
    await _authService.logout();
    loggedIn = false;
    notifyListeners();
  }

  void login(String token) async {
    await _authService.login(token);
    loggedIn = true;
    notifyListeners();
  }

  void checkLoginState() {
    loggedIn = _authService.loggedIn();
    notifyListeners();
  }
}
