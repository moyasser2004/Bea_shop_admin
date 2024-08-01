import 'package:bea_admin/controller/product_controller/delete_product_controller.dart';
import 'package:bea_admin/core/class/handle_view_data.dart';
import 'package:bea_admin/core/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/botton.dart';
import '../widget/items_list.dart';
import '../widget/text_form.dart';

class DeleteProductScreen extends StatelessWidget {
  const DeleteProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    final controller = Get.put(DeleteProductController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: const Text("Delete Item"),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: height / 1.15,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GetBuilder<DeleteProductController>(
                      builder: (controller) => HandelViewData(
                            state: controller.state!,
                            widget: VListItems(
                              searchData: controller.data,
                              width: width / 1.1,
                              height: height / 1.1,
                            ),
                            height: height / 2,
                          )),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormAuth(
                        controller: controller.idController,
                        formKey: controller.idKey,
                        label: '',
                        hint: 'Enter the id',
                        val: 'id cant be empty',
                        icon: Icon(
                          Icons.production_quantity_limits_outlined,
                          color: AppColor.primaryLight,
                        ),
                        onFiledSubmit: (String value) {},
                        obscure: false,
                        color: AppColor.black54,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormAuth(
                        controller: controller.indexController,
                        formKey: controller.indexKey,
                        label: '',
                        hint: 'Enter the index',
                        val: 'index cant be empty',
                        icon: Icon(
                          Icons.production_quantity_limits_outlined,
                          color: AppColor.primaryLight,
                        ),
                        onFiledSubmit: (String value) {},
                        obscure: false,
                        color: AppColor.black54,
                        keyboardType: TextInputType.text,
                      ),
                      const Spacer(),
                      OnBoardingButton(
                        onPressed: () {
                          controller.deleteData();
                        },
                        title: 'Delete Item',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
