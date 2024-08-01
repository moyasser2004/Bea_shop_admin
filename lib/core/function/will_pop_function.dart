import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



Future<bool> willPop() {

  Get.defaultDialog(
      title: "WARING".tr,
      middleText: "Do you want to \n Exit from Application".tr,
      backgroundColor: Colors.transparent.withOpacity(.4),
      titleStyle: const TextStyle(
        color: Colors.red,
        fontSize: 16,
      ),
      middleTextStyle:
          const TextStyle(color: Colors.white, fontSize: 14, height: 2),
      radius: 20,
      actions: [
        MaterialButton(
          child: Container(
            height: 30,
            width: double.infinity,
          decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Center(
              child: Text("Cancel",textAlign: TextAlign.center,),
            )
          ),
          onPressed: () {
            Get.back();
          },
        ),

        MaterialButton(
          child: Container(
              height: 30,
              width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child:  const Center(
              child: Text("OK",textAlign: TextAlign.center,),
            )
          ),
          onPressed: () {
            exit(0);
          },
        ),
      ]);

  return Future.value(true);
}
