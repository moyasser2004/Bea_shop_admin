import 'dart:io';

import 'package:bea_admin/core/class/request_state.dart';
import 'package:bea_admin/core/const/app_routes.dart';
import 'package:bea_admin/core/function/handling_response.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/class/curd.dart';
import '../../data/category_data/Category_remote_data.dart';

class AddCategoryController extends GetxController {
  late TextEditingController nameArController;
  late TextEditingController nameEnController;

  late GlobalKey<FormState> nameArKey;
  late GlobalKey<FormState> nameEnKey;

  File? image;
  File? icon;

  CategoryRemoteData categoryRemoteData = CategoryRemoteData(Curd());
  RequestState? state;

  void getIcon() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    icon = File(xFile!.path);
    update();
  }

  void getImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(xFile!.path);
    update();
  }

  void insertData() async {
    uploadImage();
  }

  String? valueIcon;
  String? valueImage;

  void uploadImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('category_image/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        valueImage = value;

        firebase_storage.FirebaseStorage.instance
            .ref()
            .child('category_icon/${Uri.file(icon!.path).pathSegments.last}')
            .putFile(icon!)
            .then((value) {
          value.ref.getDownloadURL().then((value) async {
            valueIcon = value;
          }).catchError((error) {});
        }).catchError((error) {});

        if (icon != null && image != null) {
          state = RequestState.loading;
          update();

          final result = await categoryRemoteData.postData(
            nameAr: value.toString(),
            nameEn: nameEnController.text,
            icon: valueIcon!,
            image: valueImage!,
          );
          state = handleResponse(result);
          print("state-----------------------------------------------------$state");
          if (state == RequestState.loaded) {
            if (result["status"] == "success") {
              nameEnController.clear();
              nameArController.clear();
              Get.snackbar("Category", "Add New Category",
                  duration: const Duration(seconds: 5));
            }
          } else {
            Get.snackbar("Category", "Cant Add New Category",
                duration: const Duration(seconds: 5));
          }
        } else {
          Get.snackbar("Category", "image or icon cant be null",
              duration: const Duration(seconds: 5));
        }
      }).catchError((error) {});
    }).catchError((error) {});
  }

  void toDeleteCategory() {
    Get.toNamed(AppRouter.deleteCategoryScreen);
  }

  @override
  void onInit() {
    nameEnController = TextEditingController();
    nameArController = TextEditingController();

    nameEnKey = GlobalKey<FormState>();
    nameArKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    nameArController.dispose();
    nameEnController.dispose();
    super.dispose();
  }
}
