
class AppLink {

  //http://localhost/shopApp/auth/sigin.php

  static const String serverLink = "http://192.168.1.9/shopApp/";


  static String categoryImage(String image) {
    return "${serverLink}upload/$image";
  }

  //coupon
  static const String couponAddLink = "${serverLink}coupon/add.php";
  static const String couponViewLink = "${serverLink}coupon/view.php";

  //order
  static const String getOrders = "${serverLink}admin/getorder.php";
  static const String orderState1 = "${serverLink}admin/oredrapprove.php";
  static const String orderState2 = "${serverLink}admin/orderde.php";
  static const String orderState3 = "${serverLink}admin/orederrecive.php";

  //items
  static const String addItem = "${serverLink}admin/addItem.php";
  static const String deleteItem = "${serverLink}admin/deleteItem.php";

  //categories
  static const String addCategory = "${serverLink}admin/addcategory.php";
  static const String getCategory = "${serverLink}admin/getcategory.php";
  static const String deleteCategory = "${serverLink}admin/deletecategory.php";
  static const String getItems = "${serverLink}favorite/getallitem.php";





}
