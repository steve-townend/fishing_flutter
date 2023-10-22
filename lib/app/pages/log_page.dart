import 'package:flutter/material.dart';

import '../components/app_bar_and_nav_bar_scaffold.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as String;

    return AppBarAndNavBarScaffold(
      navName: "Log",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              "Log...$args",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ],
          ),
        )
      ),
    );
  }
}