import 'package:bea_admin/view/screens/add_product_screen.dart';
import 'package:bea_admin/view/screens/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/screens/add_category_screen.dart';



class HomeController extends GetxController{

  late int currentIndex ;
  late GlobalKey bottomNavigationKey;

  List<Widget> pages=[
      const AddCategoryScreen(),
      const AddProductScreen(),
      const OrderScreen(),
  ];

  void getIndex(int index){
    currentIndex=index;
    update();
  }

  @override
  void onInit() {
    bottomNavigationKey= GlobalKey();
    currentIndex =1;
    super.onInit();
  }

}