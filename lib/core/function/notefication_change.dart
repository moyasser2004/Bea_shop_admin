import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../controller/order_controller/order_controller.dart';

Future<void> requestPermissionNotification() async {
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    Get.snackbar(message.notification!.title!, "${message.notification!.body!} " "${message.data['pageid']}",duration: const Duration(seconds: 7));
    refreshPageNotification(message.data);
  });
}


refreshPageNotification(data) {
  if (data['pagename'] == "orders") {
    OrderController controller=Get.put(OrderController());
    controller.getOrders();

  }
}


