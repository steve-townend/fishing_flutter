import 'package:_app_framework/app/components/app_bar_and_nav_bar_scaffold.dart';
import 'package:flutter/material.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as String;

    return AppBarAndNavBarScaffold(
      navName: "Trips",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              "Trips...$args",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ],
          ),
        )
      ),
    );
  }
}