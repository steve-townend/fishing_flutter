// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:_app_framework/app/TestPages/rest_api_view_model.dart';
import 'package:_app_framework/app/auth/auth_page.dart';
import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:_app_framework/app/catches/views/catches_view.dart';
import 'package:_app_framework/app/new_trip/view_models/new_trip_view_model.dart';
import 'package:_app_framework/app/pages/log_page.dart';
import 'package:_app_framework/app/trips/view_models/trips_view_model.dart';
import 'package:_app_framework/app/trips/views/trips_summaries_view.dart';
import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_services/api_service.dart';
import 'package:_app_framework/common_services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'app/TestPages/rest_api.dart';
import 'app/home/home_page.dart';
import 'app/home/about_page.dart';
import 'app/auth/login_page.dart';
import 'app/material_app_builder.dart';
import 'common_services/color_service.dart';
import 'app/pages/search_page.dart';
import 'app/pages/my_sites_page.dart';
import 'ioc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  getServices();
  Logger.level = kDebugMode ? Level.verbose :  Level.info;

  final _authService = getIt.get<AuthService>(); 
  await _authService.setupStorage();

  runApp(
    ChangeNotifierProvider<AuthProviderController>(
      create: (_) => AuthProviderController(),
      child: const MyApp()
    )
  );
} 

class MyApp extends StatelessWidget {
   const MyApp({super.key});
    
  @override
  Widget build(BuildContext context) {

    // return MultiProvider(
    //   providers: [
    //     Provider<AppSettingsService>(
    //       create: (_) => AppSettingsService(),
    //     ),
    //     Provider<ColorService>(
    //       create: (_) => ColorService(),
    //     ),
    //     Provider<LoggingService>(
    //       create: (_) => LoggingService(),
    //     )
    //   ],
    //   child: MaterialAppBuilder(builder: (context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestApiViewModel>(
          create: (_) => RestApiViewModel(),
        ),
        ChangeNotifierProvider<TripsViewModel>(
          create: (_) => TripsViewModel(),
        ),
        ChangeNotifierProvider<NewTripViewModel>(
          create: (_) => NewTripViewModel(),
        ),
      ],
      child:  MaterialAppBuilder(builder: (context) {
        //final colorService = Provider.of<ColorService>(context, listen: false);
        final colorService = getIt.get<ColorService>();
        //final loggingService = Provider.of<LoggingService>(context, listen: false);

        //final logger = loggingService.getLogger(this);
        // logger.d("A test debug message");
        // logger.i("A test info message");
        // logger.e("A test error message");

        // try {
        //   throw Exception("Exceptions own message");
        // } catch (ex, st) {
        //   logger.e("A test error message with error", ex, st);
        // }


        final apiService = getIt.get<ApiService>();
        apiService.authProvider = context.read<AuthProviderController>();

        return MaterialApp(
          scaffoldMessengerKey: snackbarKey,
          theme: ThemeData(primarySwatch: MaterialColor(0xFF4F7942, colorService.colorSwatchShades)),
          debugShowCheckedModeBanner: false,
          //initialRoute: "/authPage",
          home: const AuthPage(),
          routes: {
            "/home": (_) => const HomePage(),
            "/testRestAPI": (_) => const RestApiView(),
            "/about": (_) => const AboutPage(),
            "/login": (_) => LoginPage(),
            "/authPage": (_) => const AuthPage(),

            "/trips": (_) => const TripSummariesView(),
            "/catches": (_) => const CatchesView(),
            "/log": (_) => const LogPage(),
            "/search": (_) => const SearchPage(),
            "/mySites": (_) => const MySitesPage(),

          }
        );
      })
      );
    // );
  }

  
}

