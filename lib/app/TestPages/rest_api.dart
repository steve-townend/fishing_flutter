import 'dart:async';

import 'package:_app_framework/common_services/api_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:flutter/material.dart';

import '../../common_models/us_data.dart';
import '../../common_services/logging_service.dart';
import '../components/app_bar_and_nav_bar_scaffold.dart';


class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  RestApiState createState() => RestApiState();
}

class RestApiState extends State<RestApi> {
  late Future<USData> futureUSData;

  @override
  void initState() {
    super.initState();

    final loggingService = getIt.get<LoggingService>();
    // final loggingService = Provider.of<LoggingService>(context, listen: false);
    final logger = loggingService.getLogger(this);

    // final apiService = ApiService();
    final apiService = getIt.get<ApiService>();
    
    try {
      futureUSData = apiService.fetchData<USData>('https://datausa.io/api/data?drilldowns=Nation&measures=Population', USData.parseJson);  
    } catch (ex, st) 
    {
      logger.e("HTTP Error", ex, st);
    }
  }

  @override
  Widget build(BuildContext context) {

    return AppBarAndNavBarScaffold(
      navName: "Browse",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<USData>(
                future: futureUSData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return  Column(
                      children: [
                        Text("Test a Rest API", style: Theme.of(context).textTheme.headlineMedium),
                        Text(snapshot.data!.data[3].toString())
                      ]
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        )
      ),
    );


  }
}
