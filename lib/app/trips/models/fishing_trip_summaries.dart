// To parse this JSON data, do
//
//     final fishingTripSummaries = fishingTripSummariesFromJson(jsonString);

import 'dart:convert';

List<FishingTripSummaries> fishingTripSummariesFromJson(String str) => List<FishingTripSummaries>.from(json.decode(str).map((x) => FishingTripSummaries.fromJson(x)));

String fishingTripSummariesToJson(List<FishingTripSummaries> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FishingTripSummaries {
    int id;
    DateTime date;
    String location;
    String riverLevel;
    String catchSummary;
    String baitSummary;

    FishingTripSummaries({
        required this.id,
        required this.date,
        required this.location,
        required this.riverLevel,
        required this.catchSummary,
        required this.baitSummary,
    });

    factory FishingTripSummaries.fromJson(Map<String, dynamic> json) => FishingTripSummaries(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        location: json["location"],
        riverLevel: json["riverLevel"],
        catchSummary: json["catchSummary"],
        baitSummary: json["baitSummary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "location": location,
        "riverLevel": riverLevel,
        "catchSummary": catchSummary,
        "baitSummary": baitSummary,
    };
}
