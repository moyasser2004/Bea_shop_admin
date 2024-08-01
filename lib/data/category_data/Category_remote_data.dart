import 'dart:io';

import 'package:bea_admin/core/const/app_link.dart';

import '../../core/class/curd.dart';

class CategoryRemoteData {
  Curd curd;

  CategoryRemoteData(this.curd);

  postData({
    required String nameAr,
    required String nameEn,
    required String icon,
    required String image,
  }) async {
    var response = await curd.post(
      AppLink.addCategory,
      {
        "categories_name": nameEn,
        "categories_name_ar": nameAr,
        "categories_icons": icon,
        "categories_images": image,
      },
    );

    return response.fold((l) => l, (r) => r);
  }

   getData() async {
    var response = await curd.post(AppLink.getCategory, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData({
    required String id,
    required String imageName,
    required String iconName,
})async{
    var response = await curd.post(
      AppLink.deleteCategory,
      {
        "categories_id": id,
        "categories_icons": iconName,
        "categories_images": imageName,
      }
    );
    return response.fold((l) => l, (r) => r);
  }

}
