import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/app_color.dart';
import '../../controller/home_controller/HomeController.dart';


class BottomNavBar extends GetView<HomeController> {

  final dynamic Function(int) onTabChangedListener;
  final GlobalKey bottomNavigationKey;

  const BottomNavBar(
      {
        Key? key,
        required this.onTabChangedListener,
        required this.bottomNavigationKey,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
        barBackgroundColor: AppColor.primary,
        circleColor: AppColor.white,
        activeIconColor: AppColor.black,
        inactiveIconColor: AppColor.white,
        tabs: [
          TabData(iconData: Icons.category_outlined, title: " Category ",),
          TabData(iconData: Icons.production_quantity_limits_outlined, title: " Product ",),
          TabData(iconData: Icons.delivery_dining_rounded, title: "Order"),
        ],
        initialSelection: controller.currentIndex,
        key: bottomNavigationKey,
        onTabChangedListener: onTabChangedListener
    );
  }
}
