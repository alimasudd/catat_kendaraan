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

  void logout() {
    AlertDialogWidget.showAlertDialog(Get.context as BuildContext,
        'Keluar', 'Anda yakin ingin keluar', 'Keluar', () async {
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed(Routes.LOGIN);
        });
  }

  Stream<List<DataModel>> streamDataByUserId() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('data')
        .where('user_id', isEqualTo: userId)
        .snapshots()
        .map((QuerySnapshot query) {
      List<DataModel> dataList = [];
      for (var doc in query.docs) {
        dataList.add(DataModel.fromDocument(doc));
      }
      return dataList;
    });
  }

  void updateData(id, views) async {
    try{
      int currentViews = views;
      currentViews += 1;
      final docData = FirebaseFirestore.instance
          .collection('data')
          .doc(id);
      await docData.update({
        'views' : currentViews
      });
    }on FirebaseException catch(e){
      debugPrint('firebaseError $e');
    }
  }
}
