// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:_app_framework/app/components/styled_button.dart';
import 'package:_app_framework/app/components/styled_textfield.dart';
import 'package:_app_framework/common_models/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_bar_and_nav_bar_scaffold.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return AppBarAndNavBarScaffold(
      navName: "Login",
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            const Icon(
              Icons.lock,
              size: 100),
            
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
              controller: usernameController,
              maxWidth: 250,
            ),

            const SizedBox(height: 10),
            StyledTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
              maxWidth: 250,
            ),

            const SizedBox(height: 25),
            StyledButton(
              onTap: () async {
                try {
                  await context.read<AuthProviderController>().login(usernameController.text, passwordController.text);
                  showMessage(message: "Welcome");
                } catch (ex) {
                  showMessage(message: ex.toString(), failed: true);
                }
              }, 
              text: "Sign in",
              maxWidth: 250,
            ),

          ],
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