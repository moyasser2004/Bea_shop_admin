import 'package:bea_admin/core/class/curd.dart';
import 'package:bea_admin/core/class/request_state.dart';
import 'package:bea_admin/core/function/handling_response.dart';
import 'package:get/get.dart';

import '../../data/order_data/order_remote_data.dart';

class OrderController extends GetxController {

  OrderRemoteData orderRemoteData = OrderRemoteData(Curd());
  RequestState? state;
  List data = [];

   getOrders() async {
     data.clear();
    state = RequestState.loading;
    update();
    final result = await orderRemoteData.getData();
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        data.addAll(result["data"]);
      }
    }
    update();
  }

  void getOrderState1({
    required String userId,
    required String cartId,
  }) async {
    state = RequestState.loading;
    update();
    final result = await orderRemoteData.orderState1(userId: userId, cartId: cartId);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        await getOrders();
        Get.snackbar("Orders", "The Order Has Approved ",duration: const Duration(seconds: 5));

      }
    }
    update();
  }




  void getOrderState2({
    required String userId,
    required String cartId,
}) async {
    state = RequestState.loading;
    update();
    final result = await orderRemoteData.orderState2(userId: userId, cartId: cartId);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        await getOrders();
        Get.snackbar("Orders", "The Order Will delivery",duration: const Duration(seconds: 5));
      }
    }
    update();
  }

  void getOrderState3({
    required String userId,
    required String cartId,
}) async {
    state = RequestState.loading;
    update();
    final result = await orderRemoteData.orderState3(userId: userId, cartId: cartId);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        await getOrders();
        Get.snackbar("Orders", "The Order Has Approved",duration: const Duration(seconds: 5));
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
