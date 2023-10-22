// To parse this JSON data, do
//
//     final authData = authDataFromJson(jsonString);

import 'dart:convert';

AuthData authDataFromJson(String str) => AuthData.fromJson(json.decode(str));

String authDataToJson(AuthData data) => json.encode(data.toJson());

class AuthData {
    int id;
    String firstName;
    String lastName;
    String username;
    String token;

    AuthData({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.token,
    });

    factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "token": token,
    };
}
