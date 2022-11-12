// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));


class Movie {
    Movie({
        required this.id,
        required this.url,
        required this.name,
        required this.type,
        required this.language,
        required this.genres,
        required this.status,
        required this.runtime,
        required this.averageRuntime,
        required this.premiered,
        required this.ended,
        required this.officialSite,
        required this.schedule,
        required this.rating,
        required this.weight,
        required this.network,
        required this.webChannel,
        required this.dvdCountry,
        required this.externals,
        required this.image,
        required this.summary,
        required this.updated,
        required this.links,
    });

    int id;
    String url;
    String name;
    String type;
    String language;
    List<String> genres;
    String status;
    int? runtime;
    int averageRuntime;
    DateTime premiered;
    DateTime? ended;
    String? officialSite;
    Schedule schedule;
    Rating rating;
    int weight;
    Network? network;
    dynamic webChannel;
    dynamic dvdCountry;
    Externals externals;
    Images image;
    String summary;
    int updated;
    Links links;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"] == null ? null : json["officialSite"],
        schedule: Schedule.fromJson(json["schedule"]),
        rating: Rating.fromJson(json["rating"]),
        weight: json["weight"],
        network: json["network"] == null ? null : Network.fromJson(json["network"]),
        webChannel: json["webChannel"],
        dvdCountry: json["dvdCountry"],
        externals: Externals.fromJson(json["externals"]),
        image: Images.fromJson(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: Links.fromJson(json["_links"]),
    );


}

class Externals {
    Externals({
        required this.tvrage,
        required this.thetvdb,
        required this.imdb,
    });

    int tvrage;
    int? thetvdb;
    String? imdb;

    factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
    );

    Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
    };
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
        required this.previousepisode,
    });

    Previousepisode self;
    Previousepisode previousepisode;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Previousepisode.fromJson(json["self"]),
        previousepisode: Previousepisode.fromJson(json["previousepisode"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "previousepisode": previousepisode.toJson(),
    };
}

class Previousepisode {
    Previousepisode({
        required this.href,
    });

    String href;

    factory Previousepisode.fromJson(Map<String, dynamic> json) => Previousepisode(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Network {
    Network({
        required this.id,
        required this.name,
        required this.country,
        required this.officialSite,
    });

    int id;
    String name;
    Country country;
    String? officialSite;

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country: Country.fromJson(json["country"]),
        officialSite: json["officialSite"] == null ? null : json["officialSite"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country.toJson(),
        "officialSite": officialSite == null ? null : officialSite,
    };
}

class Country {
    Country({
        required this.name,
        required this.code,
        required this.timezone,
    });

    String name;
    String code;
    String timezone;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
    };
}

class Rating {
    Rating({
        required this.average,
    });

    dynamic average;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"],
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}

class Schedule {
    Schedule({
        required this.time,
        required this.days,
    });

    String time;
    List<String> days;

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
    };
}
