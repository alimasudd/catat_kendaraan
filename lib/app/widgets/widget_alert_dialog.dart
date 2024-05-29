import 'package:flutter/material.dart';

import '../core/colors.dart';

class AlertDialogWidget{

  static Future<void> showAlertDialog(
      BuildContext context,
      String title,
      String content,
      String buttonText,
      VoidCallback onPressed) async {

    // set up the buttons
    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey.shade700,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(
            width: 2, color: AppColors.grey),
      ),
      child: Text("Batal", style: TextStyle(fontSize: 13, color: Colors.grey.shade700),),
      onPressed:  () => Navigator.of(context, rootNavigator: true).pop(),
    );

    Widget continueButton = TextButton(
        onPressed:  onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(
            width: 2, color: AppColors.primary),
      ),
        child: Text(buttonText,
          style: const TextStyle(fontSize: 13, color: AppColors.white),)
    );

    AlertDialog alert = AlertDialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(7)),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}