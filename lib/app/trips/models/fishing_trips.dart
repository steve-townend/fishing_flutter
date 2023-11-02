// To parse this JSON data, do
//
//     final fishingTrip = fishingTripFromJson(jsonString);

import 'dart:convert';

List<FishingTrip> fishingTripFromJson(String str) => List<FishingTrip>.from(json.decode(str).map((x) => FishingTrip.fromJson(x)));

String fishingTripToJson(List<FishingTrip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FishingTrip {
    int id;
    User user;
    DateTime date;
    Venue venue;
    Stretch stretch;
    String peg;
    String geoLocationString;
    String what3WordsLocation;
    double riverLevel;
    String trend;
    String weather;
    String notes;
    GeoLocation geoLocation;
    List<Catch> catches;

    FishingTrip({
        required this.id,
        required this.user,
        required this.date,
        required this.venue,
        required this.stretch,
        required this.peg,
        required this.geoLocationString,
        required this.what3WordsLocation,
        required this.riverLevel,
        required this.trend,
        required this.weather,
        required this.notes,
        required this.geoLocation,
        required this.catches,
    });

    factory FishingTrip.fromJson(Map<String, dynamic> json) => FishingTrip(
        id: json["id"],
        user: User.fromJson(json["user"]),
        date: DateTime.parse(json["date"]),
        venue: Venue.fromJson(json["venue"]),
        stretch: Stretch.fromJson(json["stretch"]),
        peg: json["peg"],
        geoLocationString: json["geoLocationString"],
        what3WordsLocation: json["what3WordsLocation"],
        riverLevel: json["riverLevel"]?.toDouble(),
        trend: json["trend"],
        weather: json["weather"],
        notes: json["notes"],
        geoLocation: GeoLocation.fromJson(json["geoLocation"]),
        catches: List<Catch>.from(json["catches"].map((x) => Catch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "date": date.toIso8601String(),
        "venue": venue.toJson(),
        "stretch": stretch.toJson(),
        "peg": peg,
        "geoLocationString": geoLocationString,
        "what3WordsLocation": what3WordsLocation,
        "riverLevel": riverLevel,
        "trend": trend,
        "weather": weather,
        "notes": notes,
        "geoLocation": geoLocation.toJson(),
        "catches": List<dynamic>.from(catches.map((x) => x.toJson())),
    };
}

class Catch {
    int id;
    User user;
    DateTime date;
    Species species;
    double weightDecimal;
    BaitType baitType;
    String baitDetail;
    String notes;
    bool hasPhoto;
    String weight;

    Catch({
        required this.id,
        required this.user,
        required this.date,
        required this.species,
        required this.weightDecimal,
        required this.baitType,
        required this.baitDetail,
        required this.notes,
        required this.hasPhoto,
        required this.weight,
    });

    factory Catch.fromJson(Map<String, dynamic> json) => Catch(
        id: json["id"],
        user: User.fromJson(json["user"]),
        date: DateTime.parse(json["date"]),
        species: Species.fromJson(json["species"]),
        weightDecimal: json["weightDecimal"]?.toDouble(),
        baitType: BaitType.fromJson(json["baitType"]),
        baitDetail: json["baitDetail"],
        notes: json["notes"],
        hasPhoto: json["hasPhoto"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "date": date.toIso8601String(),
        "species": species.toJson(),
        "weightDecimal": weightDecimal,
        "baitType": baitType.toJson(),
        "baitDetail": baitDetail,
        "notes": notes,
        "hasPhoto": hasPhoto,
        "weight": weight,
    };
}

class BaitType {
    int id;
    String type;

    BaitType({
        required this.id,
        required this.type,
    });

    factory BaitType.fromJson(Map<String, dynamic> json) => BaitType(
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
    };
}

class Species {
    int id;
    String species;

    Species({
        required this.id,
        required this.species,
    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        id: json["id"],
        species: json["species"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "species": species,
    };
}

class User {
    int id;
    String firstName;
    String lastName;
    String username;
    String password;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "password": password,
    };
}

class GeoLocation {
    double latitude;
    double longitude;

    GeoLocation({
        required this.latitude,
        required this.longitude,
    });

    factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Stretch {
    int id;
    String name;
    dynamic venue;

    Stretch({
        required this.id,
        required this.name,
        required this.venue,
    });

    factory Stretch.fromJson(Map<String, dynamic> json) => Stretch(
        id: json["id"],
        name: json["name"],
        venue: json["venue"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "venue": venue,
    };
}

class Venue {
    int id;
    String name;
    List<dynamic> stretches;

    Venue({
        required this.id,
        required this.name,
        required this.stretches,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        stretches: List<dynamic>.from(json["stretches"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stretches": List<dynamic>.from(stretches.map((x) => x)),
    };
}
