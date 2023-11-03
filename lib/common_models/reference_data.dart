// To parse this JSON data, do
//
//     final referenceData = referenceDataFromJson(jsonString);

import 'dart:convert';

ReferenceData referenceDataFromJson(String str) => ReferenceData.fromJson(json.decode(str));

String referenceDataToJson(ReferenceData data) => json.encode(data.toJson());

class ReferenceData {
    List<BaitType> venues;
    List<Stretch> stretches;
    List<BaitType> baitTypes;

    ReferenceData({
        required this.venues,
        required this.stretches,
        required this.baitTypes,
    });

    factory ReferenceData.fromJson(Map<String, dynamic> json) => ReferenceData(
        venues: List<BaitType>.from(json["venues"].map((x) => BaitType.fromJson(x))),
        stretches: List<Stretch>.from(json["stretches"].map((x) => Stretch.fromJson(x))),
        baitTypes: List<BaitType>.from(json["baitTypes"].map((x) => BaitType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "venues": List<dynamic>.from(venues.map((x) => x.toJson())),
        "stretches": List<dynamic>.from(stretches.map((x) => x.toJson())),
        "baitTypes": List<dynamic>.from(baitTypes.map((x) => x.toJson())),
    };
}

class BaitType {
    int id;
    String name;

    BaitType({
        required this.id,
        required this.name,
    });

    factory BaitType.fromJson(Map<String, dynamic> json) => BaitType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Stretch {
    int id;
    String name;
    int venueId;

    Stretch({
        required this.id,
        required this.name,
        required this.venueId,
    });

    factory Stretch.fromJson(Map<String, dynamic> json) => Stretch(
        id: json["id"],
        name: json["name"],
        venueId: json["venueId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "venueId": venueId,
    };
}
