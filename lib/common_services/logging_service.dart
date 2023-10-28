
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggingService {

  bool debugMode = kDebugMode;

  Logger getLogger(dynamic caller) {

    if ((debugMode)) {
      return Logger(
        printer: PrettyPrinter(
          methodCount: 5,
          errorMethodCount: 5,
          lineLength: 50,
          colors: true,
          printEmojis: true,
          printTime: false,
        )
      );

    } else {
      return Logger(printer: SimpleLogPrinter(caller.runtimeType.toString(), debugMode));
    }
  }

  Logger getLoggerNoCaller() {

    if ((debugMode)) {
      return Logger(
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 5,
          lineLength: 50,
          colors: true,
          printEmojis: true,
          printTime: false,
        )
      );

    } else {
      return Logger(printer: SimpleLogPrinter("", debugMode));
    }
  }
}

class SimpleLogPrinter extends LogPrinter {
  final String className;
  final bool debugMode;
  SimpleLogPrinter(this.className, this.debugMode);  
  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];

    StackTrace? newStackTrace;
    if (event.stackTrace != null) {
      String stackTraceString = event.stackTrace.toString();
      var frames = stackTraceString.split('\n');
      String newStackTraceString = "";

      if ((debugMode)) {
        for (var i = 0; i < 5; i++) {
          if (i == 0) {
            newStackTraceString += "${'\n'}${event.error.message}${'\n'}";
          }
          newStackTraceString += "${frames[i]}${'\n'}";
        }
      }

      newStackTrace = StackTrace.fromString(newStackTraceString);
    }

    return [(color!('$emoji $className - ${event.message}$newStackTrace'))];
  }
}