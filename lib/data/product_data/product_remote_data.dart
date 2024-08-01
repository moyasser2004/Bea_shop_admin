import 'dart:io';
import 'package:bea_admin/core/const/app_link.dart';
import '../../core/class/curd.dart';


class ProductItemRemote {

  Curd curd;
  ProductItemRemote(this.curd);

  postData({
    required String nameEn,
    required String nameAr,
    required String desEn,
    required String desAr,
    required String  count,
    required String  price,
    required String  active,
    required String  category,
    required String  discount,
    required String  rate,
    required String  color,
    required String  top,
    required String owner,
    required String file,
  })async{
  var response = await curd.post(
    AppLink.addItem,{
    "items_name" : nameEn,
    "items_name_ar" :nameAr,
    "items_des" : desEn,
    "items_des_ar" : desAr,
    "items_count" : count,
    "items_price" : price,
    "items_active" : active,
    "items_categories" : category,
    "items_discount" : discount,
    "items_rate" : rate,
    "items_colors" : color,
    "item_top" : top,
    "items_owner" : owner,
    "items_image":file
  },
  );
return response.fold((l) => l, (r) => r);
}



getData()async {
    var response = await curd.post(AppLink.getItems,{});
    return response.fold((l) => l, (r) => r);
}

deleteData({
    required String imageName,
    required String id,
})async {
    var response = await curd.post(AppLink.deleteItem,{
      "items_id": id,
      "items_image":imageName,
    });
    return response.fold((l) => l, (r) => r);
  }

}




