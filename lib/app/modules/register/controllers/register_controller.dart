import 'package:catat_kendaraan/app/core/colors.dart';
import 'package:catat_kendaraan/app/widgets/widget_dialog_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isObscure = true.obs;
  final TFName = TextEditingController();
  final TFEmail = TextEditingController();
  final TFPassword = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

}
