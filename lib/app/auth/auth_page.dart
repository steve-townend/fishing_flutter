// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:_app_framework/common_services/logging_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    final loggingService = getIt.get<LoggingService>();
    final Logger _logger = loggingService.getLogger(this);

    return Scaffold(

      body: Consumer<AuthProviderController>(
        builder: (context, authProvider, child){

          /* SMT
              I am using a Future.microtask because all sync work completes
              before any async work. Therefore the widget build (sync) completes
              before navigating to the named route. 

              I do this because I was previouly doing direct navigation i.e by
              calling HomePage() and LoginPage. However, this did not display the
              desired route once named route navigation was used as in the tab bar.

              Also, note that the nav history isn't cleared correctly using pushNamed
              so user can press back button and see page before login page. I tried
              pushNamedAndRemoveUntil but didn't work at all. In effect, not a problem
              because any attempt to load data from API that gets a 401 will re-route
              to login page so it'll do for now.
          */

          if (authProvider.loggedIn) {
            _logger.d("AuthPage: loggedIn");

            Future.microtask(() => {Navigator.pushNamed(context, "/home")});

          } else {
            _logger.d("AuthPage: NOT loggedIn");

            Future.microtask(() => {Navigator.pushNamed(context, "/login")});

          }

          return Container(); // 
        }
      )
    );
  }
}
