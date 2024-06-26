import 'package:catat_kendaraan/app/data/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/colors.dart';

class AddDataController extends GetxController {
  final TFPlat = TextEditingController();
  final TFUrl = TextEditingController();
  final TFDate = TextEditingController();
  final TFLocation = TextEditingController();
  final TFKronologi = TextEditingController();

  void pickDate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context as BuildContext,
        initialDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary, // <-- SEE HERE
              ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(1980),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now()
    );

    if (dateTime != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      //you can implement different kind of Date Format here according to your requirement
      TFDate.text = formattedDate;
    }
  }

  Future addData (DataModel data) async {
    if(TFUrl.text.isNotEmpty && TFDate.text.isNotEmpty && TFPlat.text.isNotEmpty && TFLocation.text.isNotEmpty ){
      // final docRecords = FirebaseFirestore.instance.collection('data').doc();
      //
      // data.id = docRecords.id;
      // final json = data.toJson();
      // await docRecords.set(json);
      createData();
    }else{
      Get.snackbar('Terjadi Kesalahan', 'Masih ada kolom yang kosong',
          backgroundColor: AppColors.primary, colorText: AppColors.white, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createData() async{
    // final data = DataModel(
    //     date: TFDate.text,
    //     location: TFLocation.text,
    //     urlYoutube: TFUrl.text,
    //     platNumber: TFPlat.text,
    //     views: 0);
    // addData(data);

    try{
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final docRecords = FirebaseFirestore.instance.collection('data').doc();
      await docRecords.set({
        "id" : docRecords.id,
        "user_id" : userId,
        "date" : TFDate.text,
        "location" : TFLocation.text,
        "url_youtube" : TFUrl.text,
        "plat_number" : TFPlat.text,
        "views" : 0,
        "created_at" : DateTime.now().toIso8601String(),
      });


      Get.back();
    } on FirebaseException catch (e){
      debugPrint('FirebaseError $e');
    }
  }

}
