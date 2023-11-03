

import 'package:_app_framework/app/components/dropdown.dart';
import 'package:_app_framework/app/new_trip/models/new_trip.dart';
import 'package:_app_framework/common_models/constants.dart';
import 'package:_app_framework/common_models/reference_data.dart';
import 'package:_app_framework/common_services/api_service.dart';
import 'package:_app_framework/common_services/api_status.dart';
import 'package:_app_framework/common_services/logging_service.dart';
import 'package:_app_framework/common_services/my_change_notifier.dart';
import 'package:_app_framework/ioc.dart';
import 'package:logger/logger.dart';

class NewTripViewModel extends MyChangeNotifier
{
  final _apiService = getIt.get<ApiService>();
  final _loggingService = getIt.get<LoggingService>();
  late Logger _logger;

  NewTripViewModel() {
    _logger = _loggingService.getLogger(this);
  }

  final List<DropdownItem> _venues = <DropdownItem>[];
  List<DropdownItem> get venues => _venues;

  List<DropdownItem> _stretches = <DropdownItem>[];
  List<DropdownItem> get stretches => _stretches;

  final List<DropdownItem> _baitTypes = <DropdownItem>[];
  List<DropdownItem> get baitTypes => _baitTypes;

  ReferenceData? _refData;

  setReferenceData(ReferenceData refData) async {
    clearError();

    _refData = refData;

    for (var item in refData.venues) {
      _venues.add(DropdownItem(id: item.id, value: item.name));
    }

    for (var item in refData.baitTypes) {
      _baitTypes.add(DropdownItem(id: item.id, value: item.name));
    }

    filterStretches(_venues.first.id);
  }

  filterStretches(int venueId) {
    _stretches = <DropdownItem>[];

    for (var item in _refData!.stretches.where((element) => element.venueId == venueId)) {
      _stretches.add(DropdownItem(id: item.id, value: item.name));
    }

    if (_stretches.isEmpty) {
      _stretches.add(DropdownItem(id: -1, value: "N/A"));
    }

    notifyListeners();
  }

  getReferenceData() async {
    setLoading(true);

    // Nested try-catch looks odd but only way for stackrace to show where the error actually occured
    // rather than showing somewhere inside apiService.
    try {
      try {
        var refData = await _apiService.fetchData<ReferenceData>(API_GET_REFERENCE_DATA, referenceDataFromJson);
        await setReferenceData(refData);
      }
      catch(ex) {
        Failure browseError = Failure(code: ERR_UNEXPECTED_ERROR, errorResponse: ex.toString());
        setBrowseError(browseError);
        throw Exception(ex.toString());
      }
    }
    catch(ex, st) {
      _logger.e("Failed to get reference data", ex, st);
    }
    finally {
      setLoading(false);
    }
  }

  saveTrip(NewTrip trip) async {
    setLoading(true);

    try {
      try {

        await _apiService.fetchPostData(API_NEW_TRIP, trip.toJson(), newTripFromJson);
      }
      catch(ex) {
        Failure browseError = Failure(code: ERR_UNEXPECTED_ERROR, errorResponse: ex.toString());
        setBrowseError(browseError);
        throw Exception(ex.toString());
      }
    }
    catch(ex, st) {
      _logger.e("Failed to save new trip", ex, st);
    }
    finally {
      setLoading(false);
    }
  }

}