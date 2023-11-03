// To parse this JSON data, do
//
//     final newTrip = newTripFromJson(jsonString);

import 'dart:convert';

NewTrip newTripFromJson(String str) => NewTrip.fromJson(json.decode(str));

String newTripToJson(NewTrip data) => json.encode(data.toJson());

class NewTrip {
    DateTime date;
    String peg;
    String geoLocation;
    double riverLevel;
    String trend;
    String weather;
    String notes;
    int venueId;
    int stretchId;

    NewTrip({
        required this.date,
        required this.peg,
        required this.geoLocation,
        required this.riverLevel,
        required this.trend,
        required this.weather,
        required this.notes,
        required this.venueId,
        required this.stretchId,
    });

    factory NewTrip.fromJson(Map<String, dynamic> json) => NewTrip(
        date: DateTime.parse(json["date"]),
        peg: json["peg"],
        geoLocation: json["geoLocation"],
        riverLevel: json["riverLevel"]?.toDouble(),
        trend: json["trend"],
        weather: json["weather"],
        notes: json["notes"],
        venueId: json["venueId"],
        stretchId: json["stretchId"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "peg": peg,
        "geoLocation": geoLocation,
        "riverLevel": riverLevel,
        "trend": trend,
        "weather": weather,
        "notes": notes,
        "venueId": venueId,
        "stretchId": stretchId,
    };
}
