

import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_models/user_data.dart';
import 'package:_app_framework/common_services/api_service.dart';
import 'package:_app_framework/common_services/logging_service.dart';
import 'package:_app_framework/common_services/my_change_notifier.dart';
import 'package:_app_framework/ioc.dart';
import 'package:logger/logger.dart';

class RestApiViewModel extends MyChangeNotifier
{
  final _apiService = getIt.get<ApiService>();
  final _loggingService = getIt.get<LoggingService>();
  late Logger _logger;

  RestApiViewModel() {
    _logger = _loggingService.getLogger(this);
  }

  List<Users>? _users;
  List<Users> get users => _users??[];

  setUsers(List<Users> list) async {
    clearError();
    _users = list;
  }

  getUsers() async {
    setLoading(true);

    try {
      var list = await _apiService.fetchData(API_LIST_USERS, usersFromJson);
      setUsers(list);
    }
    catch(ex, st) {
      _logger.e("Failed to get favourites list", ex, st);
      //Failure browseError = Failure(code: ERR_UNEXPECTED_ERROR, errorResponse: ex.toString());
      setBrowseError(browseError);
    }

    setLoading(false);
  }

}