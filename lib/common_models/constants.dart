// ignore_for_file: constant_identifier_names

//#region APIs

import 'dart:core';

import 'package:flutter/material.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');

const String API_BASE_PROD = "https://6u9025w4r1.execute-api.eu-west-2.amazonaws.com/Prod/api";
const String API_BASE_DEV = "https://localhost:56202/api";

const String API_LIST_USERS = "/users";
const String API_LIST_TRIPS = "/fishingTrips";
const String API_LIST_TRIP_SUMMARIES = "/fishingTrips/getSummaries";
const String API_AUTHENTICATE = "/users/authenticate";

const String API_GET_REFERENCE_DATA = "/referenceData";
const String API_NEW_TRIP = "/fishingTrips";

const String API_ANONYMOUS_CSV = "/users/authenticate";

//#endregion APIs

//#region Errors
const ERR_INVALID_API_RESPONSE = 100;
const ERR_NO_INTERNET = 101;
const ERR_INVALID_FORMAT = 102;
const ERR_UNKNOWN_ERROR = 103;
const ERR_UNEXPECTED_ERROR = 104;
//#endregion Errors

const String AUTH_TOKEN_NAME = "auth_token";


enum FavouriteCategory {
  TooDeep,
  Ideal,
  TooShallow
}



// Used to show snackbar without context
final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();