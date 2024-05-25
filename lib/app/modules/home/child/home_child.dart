
import 'package:catat_kendaraan/app/core/colors.dart';
import 'package:catat_kendaraan/app/modules/home/controllers/home_controller.dart';
import 'package:catat_kendaraan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/assets/assets.gen.dart';

class HomeChild extends StatelessWidget {
  HomeChild({
    super.key,
    required this.id,
    required this.urlImage,
    required this.location,
    required this.plat,
    required this.date,
    required this.views,
  });

  final String id;
  final String location;
  final String plat;
  final String date;
  final String urlImage;
  final int views;

  @override
  Widget build(BuildContext context) {
    final HomeController hc = Get.find();
    var width = MediaQuery.of(context).size.width;
    var urlReplace = '';
    if(urlImage.length < 40 || urlImage.length > 45){
      urlReplace = '';
    }else{
      urlReplace = urlImage.replaceAll('https://www.youtube.com/watch?v=', '');
    }
    return GestureDetector(
      onTap: () {
        hc.updateData(id, views);
        hc.YTid = urlReplace;
        Get.toNamed(Routes.DETAIL_DATA);
        // AlertDialogWidget.showAlertDialog(
        //     context, 'Konfirmasi', id, 'Buka website',
        //         () {
        //       Get.back();
        //     });
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 10),
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.grey.shade200,
        child: Row(
          children: [
            SizedBox(
                height: 120,
                width: width / 3.0,
                child: urlReplace == ""
                    ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image(image: AssetImage(Assets.images.noVideo.path), color: AppColors.primary,),)
                    : Image.network('https://img.youtube.com/vi/$urlReplace/0.jpg'),),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: width / 2.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plat,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            '$views',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          const Icon(Icons.remove_red_eye, color: Colors.grey, size: 15,)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
