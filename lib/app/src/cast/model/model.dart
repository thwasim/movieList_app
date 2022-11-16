//
//     final movieCast = movieCastFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<MovieCast> movieCastFromJson(String str) =>
    List<MovieCast>.from(json.decode(str).map((x) => MovieCast.fromJson(x)));

class MovieCast {
  MovieCast({
    required this.person,
    required this.character,
    required this.self,
    required this.voice,
  });

  Person person;
  Character character;
  bool self;
  bool voice;

  factory MovieCast.fromJson(Map<String, dynamic> json) => MovieCast(
        person: Person.fromJson(json["person"]),
        character: Character.fromJson(json["character"]),
        self: json["self"],
        voice: json["voice"],
      );
}

class Character {
  Character({
    required this.id,
    required this.url,
    required this.name,
    required this.image,
    required this.links,
  });

  int id;
  String url;
  String name;
  Images? image;
  Links links;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
        links: Links.fromJson(json["_links"]),
      );
}

class Images {
  Images({
    required this.medium,
    required this.original,
  });

  String medium;
  String original;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    required this.self,
  });

  Self self;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
      };
}

class Self {
  Self({
    required this.href,
  });

  String href;

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Person {
  Person({
    required this.id,
    required this.url,
    required this.name,
    required this.country,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.image,
    required this.updated,
    required this.links,
  });

  int id;
  String url;
  String name;
  Country country;
  DateTime? birthday;
  dynamic deathday;
  Gender? gender;
  Images image;
  int updated;
  Links links;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        country: Country.fromJson(json["country"]),
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: genderValues.map![json["gender"]],
        image: Images.fromJson(json["image"]),
        updated: json["updated"],
        links: Links.fromJson(json["_links"]),
      );
}

class Country {
  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  Name? name;
  Code? code;
  Timezone? timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: nameValues.map![json["name"]],
        code: codeValues.map![json["code"]],
        timezone: timezoneValues.map![json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "code": codeValues.reverse![code],
        "timezone": timezoneValues.reverse![timezone],
      };
}

enum Code { US, CA, GB }

final codeValues = EnumValues({"CA": Code.CA, "GB": Code.GB, "US": Code.US});

enum Name { UNITED_STATES, CANADA, UNITED_KINGDOM }

final nameValues = EnumValues({
  "Canada": Name.CANADA,
  "United Kingdom": Name.UNITED_KINGDOM,
  "United States": Name.UNITED_STATES
});

enum Timezone { AMERICA_NEW_YORK, AMERICA_HALIFAX, EUROPE_LONDON }

final timezoneValues = EnumValues({
  "America/Halifax": Timezone.AMERICA_HALIFAX,
  "America/New_York": Timezone.AMERICA_NEW_YORK,
  "Europe/London": Timezone.EUROPE_LONDON
});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
