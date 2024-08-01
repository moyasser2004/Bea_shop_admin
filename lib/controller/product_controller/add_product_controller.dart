import 'dart:io';

import 'package:bea_admin/core/const/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/class/curd.dart';
import '../../core/class/request_state.dart';
import '../../core/function/handling_response.dart';
import '../../data/product_data/product_remote_data.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddProductController extends GetxController {

  late TextEditingController nameArController;
  late TextEditingController nameEnController;
  late TextEditingController desArController;
  late TextEditingController desEnController;
  late TextEditingController countController;
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController colorController;
  late TextEditingController ownerController;

  late GlobalKey<FormState> nameArKey;
  late GlobalKey<FormState> nameEnKey;
  late GlobalKey<FormState> desArKey;
  late GlobalKey<FormState> desEnKey;
  late GlobalKey<FormState> countKey;
  late GlobalKey<FormState> priceKey;
  late GlobalKey<FormState> discountKey;
  late GlobalKey<FormState> colorKey;
  late GlobalKey<FormState> ownerKey;

  late bool topCheckBox;

  late bool activeCheckBox;

  late int category;
  File? myFile;

  void changActive(bool? value) {
    activeCheckBox = value!;
    update();
  }

  void changTop(bool? value) {
    topCheckBox = value!;
    update();
  }

  void changeCategory(int? value) {
    category = value!;
    update();
  }

  void imagePicker() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myFile = File(xFile!.path);
    update();
  }

  ProductItemRemote productItemRemote = ProductItemRemote(Curd());
  RequestState? state;

  String? valueImage;

  addItem() async {
    if (nameArKey.currentState!.validate() &&
        nameEnKey.currentState!.validate() &&
        desArKey.currentState!.validate() &&
        countKey.currentState!.validate()) {
      if (myFile != null) {
        state = RequestState.loading;
        update();

        firebase_storage.FirebaseStorage.instance
            .ref()
            .child('items_image/${Uri
            .file(myFile!.path)
            .pathSegments
            .last}')
            .putFile(myFile!)
            .then((value) {
          value.ref.getDownloadURL().then((value) async {
            valueImage = value;
            final result = await productItemRemote.postData(
              nameEn: nameEnController.text,
              nameAr: nameEnController.text,
              desEn: desEnController.text,
              desAr: desArController.text,
              count: countController.text,
              price: priceController.text,
              active: activeCheckBox ? "1" : "0",
              category: category.toString(),
              discount: discountController.text,
              rate: ".1",
              color: colorController.text,
              top: topCheckBox ? "1" : "0",
              owner: ownerController.text,
              file: valueImage!,
            );


            state = handleResponse(result);
            print("------------------------------------------$state");
            if (state == RequestState.loaded) {
              if (result["status"] == "success") {
                nameArController.clear();
                nameEnController.clear();
                desArController.clear();
                desEnController.clear();
                countController.clear();
                priceController.clear();
                discountController.clear();
                colorController.clear();
                ownerController.clear();
                Get.snackbar("Product", "Add new product",
                    duration: const Duration(seconds: 5));
              } else {
                state = RequestState.notData;
                Get.snackbar("Product", "Cant add new product",
                    duration: const Duration(seconds: 5));
              }
              update();
            } else {
              Get.snackbar("Product", "Not image selected",
                  duration: const Duration(seconds: 5));
            }
          }).catchError((error) {});
        }).catchError((error) {});
      }
    }
  }

  void toDeleteScreen() {
    Get.toNamed(AppRouter.deleteProductScreen);
  }

  @override
  void onInit() {
    nameArController = TextEditingController();
    nameEnController = TextEditingController();
    desArController = TextEditingController();
    desEnController = TextEditingController();
    countController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    colorController = TextEditingController();
    ownerController = TextEditingController();

    nameArKey = GlobalKey<FormState>();
    nameEnKey = GlobalKey<FormState>();
    desArKey = GlobalKey<FormState>();
    desEnKey = GlobalKey<FormState>();
    countKey = GlobalKey<FormState>();
    priceKey = GlobalKey<FormState>();
    discountKey = GlobalKey<FormState>();
    colorKey = GlobalKey<FormState>();
    ownerKey = GlobalKey<FormState>();
    topCheckBox = false;
    activeCheckBox = false;
    category = 1;
    super.onInit();
  }

  @override
  void dispose() {
    nameArController.dispose();
    nameEnController.dispose();
    desArController.dispose();
    desEnController.dispose();
    countController.dispose();
    priceController.dispose();
    discountController.dispose();
    colorController.dispose();
    super.dispose();
  }
}
