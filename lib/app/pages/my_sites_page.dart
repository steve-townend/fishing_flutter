import 'package:flutter/material.dart';

import '../components/app_bar_and_nav_bar_scaffold.dart';

class MySitesPage extends StatelessWidget {
  const MySitesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBarAndNavBarScaffold(
      navName: "My Sites",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              "My Sites...",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ],
          ),
        )
      ),
    );
  }
}