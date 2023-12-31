// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:_app_framework/app/components/styled_button.dart';
import 'package:_app_framework/app/components/styled_textfield.dart';
import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_services/snack_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_bar_and_nav_bar_scaffold.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final snackService = getIt.get<SnackService>();

    return AppBarAndNavBarScaffold(
      navName: "Login",
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const SizedBox(height: 25),
              const Icon(
                Icons.lock,
                size: 50),
              
              const SizedBox(height: 50),
              Text(
                "Welcome back, please login",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16
                ),
              ),
              
              const SizedBox(height: 25),
              StyledTextField(
                hintText: "Username",
                obscureText: false,
                isUsername: true,
                isPassword: false,
                controller: usernameController,
                maxWidth: 250,
              ),
      
              const SizedBox(height: 10),
              StyledTextField(
                hintText: "Password",
                obscureText: true,
                isUsername: false,
                isPassword: true,
                controller: passwordController,
                maxWidth: 250,
              ),
      
              const SizedBox(height: 25),
              StyledButton(
                onTap: () async {
                  try {
                    var name = await context.read<AuthProviderController>().login(usernameController.text, passwordController.text);
                    snackService.showMessage(message: "Welcome $name");
                  } catch (ex) {
                    snackService.showMessage(message: ex.toString(), failed: true);
                  }
                }, 
                text: "Sign in",
                maxWidth: 250,
              ),
      
            ],
          ),
        ),
      ),
    );
  }

    void showMessage({required String message, bool failed = false}) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: failed ? Colors.red : Colors.green,
      )
    );
  }
}