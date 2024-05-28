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


}
