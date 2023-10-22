
import 'dart:convert';

import 'package:_app_framework/app/auth/auth_interceptor.dart';
import 'package:_app_framework/app/auth/auth_provider_controller.dart';
import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_services/logging_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiService {

  AuthProviderController? _authProvider;

  set authProvider(AuthProviderController? authProvider) {
     _authProvider = authProvider;
  }

  final _loggingService = getIt.get<LoggingService>();
  late Logger _logger;


  // Create a Dio object
  var dio = Dio();

  ApiService() {
    _logger = _loggingService.getLogger(this);

    if (isProduction) {
      dio.options.baseUrl = API_BASE_PROD;
    } else {
      dio.options.baseUrl = API_BASE_DEV;
    }

    dio.interceptors.add(AuthInterceptor());
  }

  Future<T> fetchData<T>(String url, T Function(String) parser) async {

    try {
      Response<String> response = await dio.get(url);

      if (response.statusCode == 200) {

        // If the server did return a 200 OK response,
        // then parse the JSON.
        return parser(response.data?? "");

      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        // SMT: This is probably superceeded by the catch block below, now
        //      that we are using dio
        throw Exception('Failed to load data from: $url');
      }

    } on DioException catch (ex, st) {
      if (ex.response!.statusCode == 401) {
        var message = "Not authorised at $url, re-routing to login page";

        _logger.e(message, ex, st);
        _authProvider?.logout();

        throw Exception(message);

      } else {
        _logger.e("Failed getting data from $url, ${ex.response!.data}", ex, st);
        throw Exception('Failed to load data from: $url');
      }
    } catch (ex, st) {
      _logger.e("Unexpected error from $url", ex, st);
      throw Exception('Failed to load data from: $url');
    }
  }

  Future<Object> fetchPostData(String url, dynamic body, Function(String) parser) async {

    try {
      Response<String> response = await dio.post(url, data: json.encode(body));

      if (response.statusCode == 200) {

        // If the server did return a 200 OK response,
        // then parse the JSON.
        return parser(response.data?? "");

      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        // SMT: This is probably superceeded by the catch block below, now
        //      that we are using dio
        throw Exception('Failed to post data to: $url');
      }

    } on DioException catch (ex, st) {
      if (ex.response!.statusCode == 401) {
        var message = "Not authorised at $url, re-routing to login page";

        _logger.e(message, ex, st);
        _authProvider?.logout();

        throw Exception(message);

      } else {
        _logger.e("Failed getting data from $url, ${ex.response!.data}", ex, st);
        throw Exception('Failed to load data from: $url');
      }
    } catch (ex, st) {
      _logger.e("Unexpected error from $url", ex, st);
      throw Exception('Failed to post data to: $url');
    }
  }
}
