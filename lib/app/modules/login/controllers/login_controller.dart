import 'package:catat_kendaraan/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../../../widgets/widget_dialog_info.dart';

class LoginController extends GetxController {

  var isObscure = true.obs;
  final TFEmail = TextEditingController();
  final TFPassword = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void login() async {
    if (TFEmail.text.isNotEmpty && TFPassword.text.isNotEmpty) {
      try {
        final credential = await auth.signInWithEmailAndPassword(
            email: TFEmail.text,
            password: TFPassword.text
        );

        if (credential.user != null){
          if(credential.user!.emailVerified == true){
            Get.offAllNamed(Routes.HOME);
          }else{
            AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Verifikasi', 'Email anda belum terverifikasi, silahkan verifikasi email anda', 'Saya Mengerti', () {
              Get.back();
            });
          }
        }

      } on FirebaseAuthException catch (e) {
        print('objectError ${e.code}');
        if (e.code == 'user-not-found') {
          AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Peringatan', 'Email belum didaftarkan', 'OKE', () {
            Get.back();
          });
        } else if (e.code == 'wrong-password') {
          AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Peringatan', 'Password yang anda masukkan salah', 'OKE', () {
            Get.back();
          });
        } else if(e.code == 'too-many-requests'){
          AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Peringatan', 'Anda terlalu banyak mencoba login. Cobalah beberapa saat lagi', 'OKE', () {
            Get.back();
          });
        }
      }
    }else{
      AlertDialogInfo.showAlertDialog(Get.context as BuildContext, true, 'Peringatan', 'Email atau password masih kosong', 'OKE', () {
        Get.back();
      });
    }
  }

}
