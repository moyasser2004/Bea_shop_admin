import 'package:bea_admin/core/const/app_link.dart';

import '../../core/class/curd.dart';

class OrderRemoteData {
  Curd curd;

  OrderRemoteData(this.curd);

  getData() async {
    var response = await curd.post(AppLink.getOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  orderState1({
    required String userId,
    required String cartId,
  }) async {
    var response = await curd.post(AppLink.orderState1, {
      "user_id": userId,
      "cart_id": cartId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderState2({
    required String userId,
    required String cartId,
  }) async {
    var response = await curd.post(AppLink.orderState2, {
      "user_id": userId,
      "cart_id": cartId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderState3({
    required String userId,
    required String cartId,
  }) async {
    var response = await curd.post(AppLink.orderState3, {
      "user_id": userId,
      "cart_id": cartId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
