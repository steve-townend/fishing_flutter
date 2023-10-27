import 'package:_app_framework/common_services/api_status.dart';
import 'package:flutter/material.dart';

class MyChangeNotifier extends ChangeNotifier {
    
  bool _loading = false;
  bool _hasError = false;
  Failure? _browseError;

  
  bool get loading => _loading;
  bool get hasError => _hasError;
  Failure get browseError => _browseError??Failure();

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners(); // Update the UI
  }

  setBrowseError(Failure error) async {
    _browseError = error;
    _hasError = true;
  }

  clearError() {
    _hasError = false;
  }
}