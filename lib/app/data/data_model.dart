import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DataModel {
  String id;
  String location;
  String urlYoutube;
  String platNumber;
  String date;
  int views;

  DataModel({
    this.id = '',
    required this.location,
    required this.urlYoutube,
    required this.platNumber,
    required this.date,
    required this.views,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"] ?? "",
    location: json["location"],
    urlYoutube: json["url_youtube"] ?? "",
    platNumber: json["plat_number"],
    date: DateFormat("dd MMMM yyyy").format(DateTime.parse(json["date"])),
    views: json["views"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "location": location,
    "url_youtube": urlYoutube,
    "plat_number": platNumber,
    "date": date,
    "views": views,
  };
}