// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_services/auth_service.dart';
import '../../ioc.dart';
import '../components/app_bar_and_nav_bar_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBarAndNavBarScaffold(
      navName: "Login",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 64),
            Text(
              "The login page",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            Consumer<AuthProviderController>(
              builder: (_, authProvider, child){
                // debugPrint('LoginPage see loggedIn as: ${context.read<AuthProviderController>().loggedIn}');
                return Center(child: Text('Logged In: ${context.read<AuthProviderController>().loggedIn}'));
              }
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                context.read<AuthProviderController>().login("dummy2");
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('Get Token'),
              onPressed: () async {
                final _authService = getIt.get<AuthService>();
                var token = await _authService.getToken();
                debugPrint('Token: $token');
              },
            ),
          ],
        ),
      ),
    );
  }
}