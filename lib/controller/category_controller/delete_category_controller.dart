import 'package:bea_admin/core/class/request_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/curd.dart';
import '../../core/function/handling_response.dart';
import '../../data/category_data/Category_remote_data.dart';

class DeleteCategoryController extends GetxController {
  late TextEditingController idController;
  late GlobalKey<FormState> idKey;

  late TextEditingController indexController;
  late GlobalKey<FormState> indexKey;

  CategoryRemoteData categoryRemoteData = CategoryRemoteData(Curd());
  RequestState? state;

  List data = [];

  getData() async {
    data.clear();
    state = RequestState.loading;
    update();
    final result = await categoryRemoteData.getData();
    state = handleResponse(result);
    print(state);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        data.addAll(result["data"]);
      }
    }
    update();
  }

  deleteData() async {
    if (indexKey.currentState!.validate() && idKey.currentState!.validate()) {
      state = RequestState.loading;
      update();
      final result = await categoryRemoteData.deleteData(
        id: idController.text,
        imageName: data[int.parse(indexController.text)]["categories_images"],
        iconName: data[int.parse(indexController.text)]["categories_icons"],
      );
      state = handleResponse(result);
      if (state == RequestState.loaded) {
        if (result["status"] == "success") {
          idController.clear();
          indexController.clear();
          await getData();
          Get.snackbar("Category", "Category deleted",
              duration: const Duration(seconds: 5));
        }
      } else {
        Get.snackbar("Category", "Cant Category deleted",
            duration: const Duration(seconds: 5));

        state = RequestState.serverFailure;
      }
      update();
    }
  }

  @override
  void onInit() {
    idController = TextEditingController();
    idKey = GlobalKey<FormState>();
    indexController = TextEditingController();
    indexKey = GlobalKey<FormState>();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    idController.dispose();
    indexController.dispose();
    super.dispose();
  }
}
