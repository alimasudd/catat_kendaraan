import 'package:catat_kendaraan/app/core/colors.dart';
import 'package:catat_kendaraan/app/routes/app_pages.dart';
import 'package:catat_kendaraan/app/widgets/widget_dialog_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../widgets/button_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: AppColors.primary),
            ),
            alignment: Alignment.center,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //email
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 30,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: controller.TFEmail,
                    style: const TextStyle(fontSize: 15),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      fillColor: AppColors.primary,
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),

                //password
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: Obx(() => TextFormField(
                    controller: controller.TFPassword,
                    obscureText: controller.isObscure.value,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(controller.isObscure.isTrue
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.isObscure.value = !controller.isObscure.value;
                          }),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      fillColor: AppColors.primary,
                      filled: false,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.primary,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                        onTap: () {}, child: const Text('Lupa Password ?'))),

                //button
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                    width: 250,
                    title: 'Login',
                    onTap: (){
                      controller.login();
                      // Navigator.pop(context);
                    }),


                //divider
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 2, color: AppColors.primary,),
                    ),
                    SizedBox(width: 20),
                    Text("atau"),
                    SizedBox(width: 20),
                    Expanded(
                      child: Divider(thickness: 2, color: AppColors.primary,),
                    ),
                  ],
                ),

                // social media
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(width: 30, child: Image(image: AssetImage(Assets.images.google.path), color: AppColors.primary,)),
                    ),
                    // const SizedBox(width: 20),
                    // SizedBox(width: 30, child: Image(image: AssetImage(Assets.images.facebook.path),)),

                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        AlertDialogInfo.showAlertDialog(context, true, 'Informasi', 'Maaf, fitur masih belum tersedia', 'Saya Mengerti', () {Get.back();});
                      },
                      child: SizedBox(width: 30, child: Image(image: AssetImage(Assets.images.apple.path), color: AppColors.primary)),
                    ),
                  ],
                ),

                //text daftar
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Tidak punya Akun ? ",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    // SizedBox(width: 5),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.REGISTER),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
