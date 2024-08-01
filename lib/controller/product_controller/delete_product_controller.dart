import 'package:bea_admin/core/class/curd.dart';
import 'package:bea_admin/core/class/request_state.dart';
import 'package:bea_admin/core/function/handling_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/const/app_color.dart';
import '../../core/const/text_style.dart';
import '../../data/product_data/product_remote_data.dart';

class DeleteProductController extends GetxController {

  late TextEditingController idController;
  late GlobalKey<FormState> idKey;

  late TextEditingController indexController;
  late GlobalKey<FormState> indexKey;

  ProductItemRemote productItemRemote = ProductItemRemote(Curd());
  RequestState? state;
  List data = [];

  getData() async {
    data.clear();
    state = RequestState.loading;
    update();
    final result = await productItemRemote.getData();
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        data.addAll(result["data"]);
      }
    }else{
      state = RequestState.serverFailure;
    }
    update();
  }

deleteData() async {
  if (indexKey.currentState!.validate() && idKey.currentState!.validate()) {
    state = RequestState.loading;
    update();
    final result = await productItemRemote.deleteData(
      imageName: data[int.parse(indexController.text)]["items_image"],
      id: idController.text,
    );
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        indexController.clear();
        idController.clear();
        await getData();
        Get.defaultDialog(
          title: '',
          middleText: 'Items deleted',
          titleStyle: AppTextStyleData.googleAmIri(color: AppColor.black),
        );
      }
    } else {
      Get.defaultDialog(
        title: '',
        middleText: 'Items not deleted',
        titleStyle: AppTextStyleData.googleAmIri(color: AppColor.black),
      );
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
