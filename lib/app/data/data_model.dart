import 'package:intl/intl.dart';

class DataModel {
  String id;
  String location;
  String urlYoutube;
  String platNumber;
  String date;

  DataModel({
    this.id = '',
    required this.location,
    required this.urlYoutube,
    required this.platNumber,
    required this.date,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"] ?? "",
    location: json["location"],
    urlYoutube: json["url_youtube"].replaceAll('https://www.youtube.com/watch?v=', ''),
    platNumber: json["plat_number"],
    date: DateFormat("dd MMMM yyyy").format(DateTime.parse(json["date"])),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "location": location,
    "url_youtube": urlYoutube,
    "plat_number": platNumber,
    "date": date,
  };
}