import 'package:flutter/material.dart';
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
                child: const Text('Launch Me too'),
                onPressed: () {
                  launchUrl(Uri.parse('https://stackoverflow.com/questions/ask'));
                },
              ),

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
