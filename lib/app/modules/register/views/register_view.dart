import 'package:catat_kendaraan/app/widgets/button_widget.dart';
import 'package:catat_kendaraan/app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(20),
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
                TextFieldWidget(
                    controller: controller.TFName,
                    title: 'Nama',
                    inputType: TextInputType.text,
                    readOnly: false),

                const SizedBox(height: 20,),
                TextFieldWidget(
                    controller: controller.TFEmail,
                    title: 'Email',
                    inputType: TextInputType.emailAddress,
                    readOnly: false),

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

                const SizedBox(height: 30,),
                ButtonWidget(
                    width: 200,
                    title: 'Submit',
                    onTap: (){
                      controller.register();
                      // Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
