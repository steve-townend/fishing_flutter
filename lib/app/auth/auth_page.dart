// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:_app_framework/app/auth/login_page.dart';
import 'package:_app_framework/app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Consumer<AuthProviderController>(
        builder: (context, authProvider, child){

          if (authProvider.loggedIn) {
            return const HomePage();
          } else {
            return LoginPage();
          }
        }
      )
    );
  }
}

