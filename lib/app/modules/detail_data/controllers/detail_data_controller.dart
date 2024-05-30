import 'package:catat_kendaraan/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailDataController extends GetxController {
  final YTController = YoutubePlayerController();
  final HomeController hc = Get.find();

  @override
  void onInit() {
    print('idYT ${hc.YTid}');
    YTController.loadVideoById(videoId: hc.YTid != '' ? hc.YTid : "KGD-T3bhFEA");
    super.onInit();
  }
}
