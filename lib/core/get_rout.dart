import 'package:bea_admin/core/const/app_routes.dart';
import 'package:bea_admin/view/screens/add_product_screen.dart';
import 'package:bea_admin/view/screens/delete_category_screen.dart';
import 'package:bea_admin/view/screens/delete_product_screen.dart';
import 'package:bea_admin/view/screens/home_screen.dart';
import 'package:bea_admin/view/screens/order_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



List<GetPage<dynamic>>? getPage=[
  GetPage(name: AppRouter.homeScreen, page: ()=> const HomeScreen() ),
  GetPage(name: AppRouter.addProductScreen, page: ()=> const AddProductScreen() ),
  GetPage(name: AppRouter.deleteProductScreen, page: ()=> const DeleteProductScreen() ),
  GetPage(name: AppRouter.orderScreen, page: ()=> const OrderScreen() ),
  GetPage(name: AppRouter.deleteCategoryScreen, page: ()=> const DeleteCategoryScreen() ),
];



