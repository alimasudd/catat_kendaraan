import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../controllers/detail_data_controller.dart';

class DetailDataView extends GetView<DetailDataController> {
  const DetailDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Data'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller.YTController, // Controler that we created earlier
            aspectRatio: 16 / 9,      // Aspect ratio you want to take in screen
          ),
        ],
      ),
    );
  }
}
