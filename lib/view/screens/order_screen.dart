import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/order_controller/order_controller.dart';
import '../../core/class/handle_view_data.dart';
import '../../core/class/request_state.dart';
import '../../core/const/app_color.dart';
import '../../core/const/text_style.dart';
import '../widget/image_border.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height <= 600
        ? 700
        : MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: GetBuilder<OrderController>(
          builder: (controller) =>
              RefreshIndicator(
                color: AppColor.primary,
                onRefresh: () async {
                  await controller.getOrders();
                },
                child: HandelViewData(
                    state: controller.state ?? RequestState.loading,
                    height: height / 1.2,
                    widget: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                              onTap: () {
                                controller.data[index]["cart_order_state"] ==
                                    0
                                    ? controller.getOrderState1(
                                    userId: controller
                                        .data[index]["cart_user_id"].toString(),
                                    cartId: controller.data[index]["cart_id"]
                                        .toString())
                                    : controller
                                    .data[index]["cart_order_state"] ==
                                    1
                                    ? controller.getOrderState2(
                                    userId: controller
                                        .data[index]["cart_user_id"].toString(),
                                    cartId: controller.data[index]["cart_id"]
                                        .toString())
                                    : controller
                                    .data[index]["cart_order_state"] ==
                                    2
                                    ? controller.getOrderState3(
                                    userId: controller
                                        .data[index]["cart_user_id"].toString(),
                                    cartId: controller.data[index]["cart_id"]
                                        .toString())
                                    : Get.defaultDialog(
                                  title: '',
                                  middleText: 'The order have received',
                                  titleStyle: AppTextStyleData.googleAmIri(
                                      color: AppColor.black),
                                );
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 12),
                                  padding: const EdgeInsets.all(10),
                                  color: AppColor.grey100,
                                  height: height / 1.8,
                                  width: width,
                                  child: Stack(
                                    children: [
                                      Container(
                                          alignment: Alignment.topRight,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .end,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 30),
                                                height: 160,
                                                width: 150,
                                                child: ImageBorder(
                                                  color: AppColor.grey200!,
                                                  height: height / 7,
                                                  image: controller.data[index]
                                                  ["items_image"],
                                                  borderColor: AppColor.black54,
                                                  padding: 15,
                                                  margin: 12,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: [
                                                  Text("Address Gover : ",
                                                      style: AppTextStyleData
                                                          .googleAraPey(
                                                          fontSize: 15,
                                                          color: AppColor
                                                              .grey700)),
                                                  Text(controller
                                                      .data[index]["address_governoral"]
                                                      .toString())
                                                ],
                                              ),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: [
                                                  Text("Address City :     ",
                                                      style: AppTextStyleData
                                                          .googleAraPey(
                                                          fontSize: 15,
                                                          color: AppColor
                                                              .grey700)),
                                                  Text(controller
                                                      .data[index]["address_city"]
                                                      .toString())
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: [
                                                  Text("Address Street : ",
                                                      style: AppTextStyleData
                                                          .googleAraPey(
                                                          fontSize: 15,
                                                          color: AppColor
                                                              .grey700)),
                                                  Text(controller
                                                      .data[index]["address_street"]
                                                      .toString())
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: [
                                                  Text("User Name : ",
                                                      style: AppTextStyleData
                                                          .googleAraPey(
                                                          fontSize: 15,
                                                          color: AppColor
                                                              .grey700)),
                                                  Text(controller
                                                      .data[index]["user_name"]
                                                      .toString())
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: [
                                                  Text("Order Phone : ",
                                                      style: AppTextStyleData
                                                          .googleAraPey(
                                                          fontSize: 15,
                                                          color: AppColor
                                                              .grey700)),
                                                  Text(controller
                                                      .data[index]["address_phone"]
                                                      .toString())
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                children: [
                                                  Text("User Phone : ",
                                                      style: AppTextStyleData
                                                          .googleAraPey(
                                                          fontSize: 15,
                                                          color: AppColor
                                                              .grey700)),
                                                  Text(controller
                                                      .data[index]["user_phone"]
                                                      .toString())
                                                ],
                                              ),

                                            ],
                                          )),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Cart Id:  ${controller
                                                    .data[index]["cart_id"]
                                                    .toString()}",
                                                style: AppTextStyleData
                                                    .googleAmIri(
                                                    fontSize: 14,
                                                    color: AppColor.black),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "Cart UserId: ${controller
                                                    .data[index]["cart_user_id"]
                                                    .toString()}",
                                                style: AppTextStyleData
                                                    .googleAmIri(
                                                    fontSize: 14,
                                                    color: AppColor.black),
                                              ),
                                              const Spacer(),
                                              Text(
                                                Jiffy(controller
                                                    .data[index]["cart_date"],
                                                    "yyyy-MM-dd HH:mm:ss")
                                                    .fromNow(),
                                                style: AppTextStyleData
                                                    .googleAmIri(
                                                    fontSize: 14,
                                                    color: AppColor.black),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              Text("Order Type : ".tr,
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              controller
                                                  .data[index]["cart_methods"] ==
                                                  1
                                                  ? const Text("delivery")
                                                  : const Text("from shop")
                                            ],
                                          ), //type
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Item Id : ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["items_id"]
                                                  .toString())
                                            ],
                                          ), //"items_id":
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Order Price : ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["items_price"]
                                                  .toString())
                                            ],
                                          ), //price
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Cart Promo Code : ".tr,
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 16,
                                                      color: AppColor.grey700)),
                                              Text(controller.data[index]
                                              ["cart_promo_code_discount"]
                                                  .toString())
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Item Discount : ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["items_discount"]
                                                  .toString())
                                            ],
                                          ), //"items_discount":
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Item Count : ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["cart_item_count"]
                                                  .toString())
                                            ],
                                          ), //""cart_item_count"":
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Item Colors : ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["items_colors"]
                                                  .toString())
                                            ],
                                          ), //"items_color":
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Items Categories: ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller.data[index]
                                              ["items_categories"]
                                                  .toString())
                                            ],
                                          ), //"items_categories":
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Items Name: ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["items_name"]
                                                  .toString())
                                            ],
                                          ), //"items_name":
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          if(controller
                                              .data[index]["cart_methods"] == 1)
                                            Row(
                                              children: [
                                                Text("Delivery Price : ".tr,
                                                    style: AppTextStyleData
                                                        .googleAraPey(
                                                        fontSize: 15,
                                                        color: AppColor
                                                            .grey700)),
                                                const Text("10"),
                                              ],
                                            ),
                                          if(controller
                                              .data[index]["cart_methods"] == 0)
                                            Row(
                                              children: [
                                                Text("From Shop : ".tr,
                                                    style: AppTextStyleData
                                                        .googleAraPey(
                                                        fontSize: 15,
                                                        color: AppColor
                                                            .grey700)),
                                                const Text("0.0"),
                                              ],
                                            ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text("Owner Phone: ",
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),
                                              Text(controller
                                                  .data[index]["items_owner"]
                                                  .toString())
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text("Order Status : \n".tr,
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 15,
                                                      color: AppColor.grey700)),

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller.data[index]
                                                ["cart_order_state"] ==
                                                    0
                                                    ? "The Order Pending Approved "
                                                    : controller.data[index]
                                                ["cart_order_state"] ==
                                                    1
                                                    ? "The Order Has Approved "
                                                    : controller.data[index]
                                                ["cart_order_state"] ==
                                                    2
                                                    ? "The Order Will delivery"
                                                    : "The Order Has delivered ",
                                                style: const TextStyle(
                                                    backgroundColor: Colors
                                                        .limeAccent,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text("Total Price : ".tr,
                                                  style: AppTextStyleData
                                                      .googleAraPey(
                                                      fontSize: 16,
                                                      color: AppColor.red)),
                                              controller
                                                  .data[index]["cart_methods"] ==
                                                  1 ?
                                              Text((((controller.data[index]
                                              ["items_price"] -
                                                  (controller.data[index]
                                                  ["items_discount"] /
                                                      100 *
                                                      (controller.data[index]
                                                      ["items_price"]))) *
                                                  controller.data[index]
                                                  ["cart_item_count"]) -
                                                  controller.data[index]
                                                  ["cart_promo_code_discount"] +
                                                  10
                                              )
                                                  .toString()) :
                                              Text((((controller.data[index]
                                              ["items_price"] -
                                                  (controller.data[index]
                                                  ["items_discount"] /
                                                      100 *
                                                      (controller.data[index]
                                                      ["items_price"]))) *
                                                  controller.data[index]
                                                  ["cart_item_count"]) -
                                                  controller.data[index]
                                                  ["cart_promo_code_discount"]
                                              )
                                                  .toString()),
                                              const Spacer(
                                                flex: 10,
                                              ),
                                              if (controller.data[index]
                                              ["cart_item_rate"] ==
                                                  0 &&
                                                  controller.data[index]
                                                  ["cart_order_state"] ==
                                                      3)
                                                const Spacer(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            )
                    )
                ),
              )
      ),
    );
  }
}
