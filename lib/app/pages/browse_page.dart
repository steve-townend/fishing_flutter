import 'package:flutter/material.dart';

import '../components/app_bar_and_nav_bar_scaffold.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as String;

    return AppBarAndNavBarScaffold(
      navName: "Browse",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              "Browse...$args",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ],
          ),
        )
      ),
    );
  }
}