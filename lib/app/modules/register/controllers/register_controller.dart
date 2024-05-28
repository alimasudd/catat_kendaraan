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

  void register() async {
    if (TFName.text.isNotEmpty && TFEmail.text.isNotEmpty && TFPassword.text.isNotEmpty) {
      try {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: TFEmail.text,
            password: TFPassword.text
        );
        if(credential.user != null){
          String uid = credential.user!.uid;

          await firestore.collection('users').doc(uid).set({
            "uid" : uid,
            "name" : TFName.text,
            "email" : TFEmail.text,
            "created_at" : DateTime.now().toIso8601String(),
          });
          await credential.user!.sendEmailVerification();
        }

        AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Informasi', 'Email verifikasi sudah terkirim. Silahkan verifikasi email anda', 'OKE', () {
          Get.back();
        });

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Terjadi Kesalahan', 'Email sudah pernah didaftarkan',
              backgroundColor: AppColors.primary, colorText: AppColors.white, snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'weak-password') {
          Get.snackbar('Terjadi Kesalahan', 'Password yang digunakan terlalu lemah',
            backgroundColor: AppColors.primary, colorText: AppColors.white, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } else {
      AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Peringatan', 'Kolom tidak boleh kosong', 'OKE', () {
        Get.back();
      });
    }
  }
}
