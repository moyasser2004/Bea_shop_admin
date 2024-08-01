import 'package:bea_admin/core/const/app_routes.dart';
import 'package:bea_admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/const/themes.dart';
import 'core/get_rout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await intiServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPage,
      initialRoute: AppRouter.homeScreen,
      title: "BEA Shop Admin",
      theme: ThemesData.theme,
    );
  }
}

