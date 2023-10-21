// ignore_for_file: no_leading_underscores_for_local_identifiers


import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common_services/auth_service.dart';
import '../../ioc.dart';
import '../components/app_bar_and_nav_bar_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return AppBarAndNavBarScaffold(
      navName: "Home",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 32),
              ElevatedButton(
                child: const Text('Logout 3'),
                onPressed: () async {
                  final _authService = getIt.get<AuthService>();
                  await _authService.logout();
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
              const SizedBox(height: 32),
              ElevatedButton(
                child: const Text('Launch me'),
                onPressed: () {
                  launchUrl(Uri.parse('https://stackoverflow.com/questions/ask'));
                },
              ),
              const SizedBox(height: 32),
              Consumer<AuthProviderController>(
                builder: (_, authProvider, child){
                  // debugPrint('HomePage see loggedIn as: ${context.read<AuthProviderController>().loggedIn}');
                  return Center(child: Text('Logged In: ${context.read<AuthProviderController>().loggedIn}'));
                }
              ),
              // const SizedBox(height: 32),
              // ElevatedButton(
              //   child: const Text('Login'),
              //   onPressed: () async {
              //     context.read<AuthProviderController>().login("dummy2");
                  
              //     // await _authService.setAccessToken("dummy");
              //     // Navigator.pushNamed(context, "/home");
              //   },
              // ),

              Text(
                'Keep a check on the rivers that you frequent for your leisure or work activities. \n\nYou can easily browse by location or can search by name or proximity. \n\nSign In to select favourite locations then set high and low level thresholds that will send notifications whenever those thresholds are breached.',
                  style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        )
      ),
    );

  }
}
