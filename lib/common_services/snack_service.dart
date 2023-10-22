import 'package:_app_framework/common_models/constants.dart';
import 'package:flutter/material.dart';

class SnackService {

  void showMessage({required String message, bool failed = false}) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: failed ? Colors.red : Colors.green,
      )
    );
  }

}