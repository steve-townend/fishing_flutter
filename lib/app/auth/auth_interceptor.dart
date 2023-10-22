import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_services/auth_service.dart';
import 'package:_app_framework/ioc.dart';
import 'package:dio/dio.dart';

/// Interceptor to send the bearer access token
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  final _authService = getIt.get<AuthService>();
  
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {

    // create a list of the endpoints where you don't need to pass a token.
    final listOfAnonymousPaths = API_ANONYMOUS_CSV.split(",");

    // Check if the requested endpoint match in the
    if (listOfAnonymousPaths.contains(options.path.toString())) {
      // if the endpoint is matched then skip adding the token.
      return handler.next(options);
    }

    // Load your token here and pass to the header
    var token = await _authService.getToken();
    options.headers.addAll({'Authorization': token});
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

}