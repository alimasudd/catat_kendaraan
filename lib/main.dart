import 'package:catat_kendaraan/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'alims project',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(

    StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return GetMaterialApp(
            title: "Application",
            initialRoute: snapshot.data !=null ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }


        )
  );
}
