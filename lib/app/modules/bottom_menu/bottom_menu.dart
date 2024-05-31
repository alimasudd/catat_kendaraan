import 'package:catat_kendaraan/app/core/colors.dart';
import 'package:catat_kendaraan/app/modules/home/controllers/home_controller.dart';
import 'package:catat_kendaraan/app/modules/home/views/home_view.dart';
import 'package:catat_kendaraan/app/widgets/tree_graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

final glbKey = GlobalKey();
class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  int _selectedIndex = 0;

  //index menu item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  //switch logic to change body of page
  Widget bodyFunction() {
    switch (_selectedIndex) {
      case 0:
        Get.lazyPut<HomeController>(
                () => HomeController(),
          );
          return const HomeView();
      // case 1:
      //   Get.lazyPut<ReportController>(
      //         () => ReportController(),
      //   );
      //   return ReportView();

      default:
        return Container(color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hc = Get.put(HomeController());
    return Scaffold(
      body: bodyFunction(),
      appBar: AppBar(
        title: const Text('TM Project'),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>TreeViewPage())),
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () => hc.logout(),
              icon: const Icon(Icons.logout)),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () => Get.toNamed(Routes.ADD_DATA),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: AppColors.primary),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.add_circle_outline, color: AppColors.primary,),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 2,
            ),
          ),
        ),
        child: BottomNavigationBar(
          key: glbKey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey.shade700,
          selectedIconTheme: IconThemeData(color: Colors.grey.shade900, size: 33),
          selectedItemColor: Colors.grey.shade900,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home, color: AppColors.primary, size: 30,)
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                // child: Icon(Icons.verified_user)
                // ImageIcon(AssetImage(Assets.icons.iconReport.path)),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings, color: AppColors.primary, size: 30,)
              ),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
