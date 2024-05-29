import 'package:catat_kendaraan/app/data/data_model.dart';
import 'package:catat_kendaraan/app/routes/app_pages.dart';
import 'package:catat_kendaraan/app/widgets/widget_alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var YTid = '';

  Stream<List<DataModel>> streamData() => FirebaseFirestore.instance
      .collection('data')
      .orderBy("date", descending: true)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((e) => DataModel.fromJson(e.data())).toList());
}
