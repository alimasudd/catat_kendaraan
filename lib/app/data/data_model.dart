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

  factory DataModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DataModel(
      id: doc.id,
      location: data["location"],
      urlYoutube: data["url_youtube"] ?? "",
      platNumber: data["plat_number"],
      date: DateFormat("dd MMMM yyyy").format(DateTime.parse(data["date"])),
      views: data["views"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "location": location,
    "url_youtube": urlYoutube,
    "plat_number": platNumber,
    "date": date,
    "views": views,
  };
}