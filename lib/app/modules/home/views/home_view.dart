import 'package:catat_kendaraan/app/modules/home/child/home_child.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder(
          stream: controller.streamData(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text('${snapshot.error}');
            }else if(snapshot.hasData){
              final records = snapshot.data!;

              return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: records.length,
                      // > 1 ? 2 : records.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeChild(
                      id: records[index].id,
                      urlImage: records[index].urlYoutube,
                      location: records[index].location,
                      plat: records[index].platNumber,
                      date: records[index].date,
                      views: records[index].views,
                    );
                  });
              // return ListView(
              //   children: records.map(controller.buildRecord).toList(),
              // );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
