import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../function/notefication_change.dart';



class MyServices extends GetxService {



  Future<MyServices> init() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.subscribeToTopic("admin");
    await FirebaseMessaging.instance.subscribeToTopic("order");
    requestPermissionNotification();
    fcmConfig();
    return this;
  }
}

Future<void> intiServices() async {
  await Get.putAsync(() => MyServices().init());
}
