import 'package:bea_admin/controller/home_controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const/app_color.dart';
import '../../core/const/text_style.dart';
import '../widget/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return  GetBuilder<HomeController>(
      builder:(controller)=> Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColor.primary,
          title: Text(
            " BEA  Shop ",
            style:
            AppTextStyleData.googleRobotoSlab(color: AppColor.white),
          ),
        ),
        bottomNavigationBar:BottomNavBar(
          onTabChangedListener: (int i) {
            controller.getIndex(i);
          },
          bottomNavigationKey: controller.bottomNavigationKey,
        ),
        body: controller.pages[controller.currentIndex],
      )
    );
  }
}
