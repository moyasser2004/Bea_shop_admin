import 'package:bea_admin/core/class/handle_view_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/category_controller/delete_category_controller.dart';
import '../../core/const/app_color.dart';
import '../widget/botton.dart';
import '../widget/image_border.dart';
import '../widget/text_form.dart';


class DeleteCategoryScreen extends StatelessWidget {
  const DeleteCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeleteCategoryController());
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: const Text("Delete Category"),
        ),
        body:  SingleChildScrollView(
          child: SizedBox(
            height: height/1.15,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GetBuilder<DeleteCategoryController>(
                      builder: (controller)=> GetBuilder<DeleteCategoryController>(
                        builder: (con)=> HandelViewData(
                            state: con.state!,
                            height: height/2,
                            widget:  ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (BuildContext context, int index) =>  SizedBox(
                                  height: height/5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ImageBorder(
                                          image: controller.data[index]["categories_images"],
                                          borderColor: AppColor.black,
                                          height: height/10,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(controller.data[index]["categories_name"]),
                                              Text("id: ${controller.data[index]["categories_id"]}"),
                                              Text("index: ${index.toString()}"),
                                            ],
                                          )
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ImageBorder(
                                          image: controller.data[index]["categories_icons"],
                                          borderColor: AppColor.black,
                                          height: height/10,
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                            )
                        ),
                      )
                  ),
                ),
                const SizedBox(height:25,),
                Expanded(
                  child: Column(
                    children: [
                      TextFormAuth(
                        controller: controller.idController,
                        formKey: controller.idKey,
                        label: '',
                        hint: 'Enter the id',
                        val: 'id cant be empty',
                        icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
                        onFiledSubmit: (String value  ) {

                        },
                        obscure: false,
                        color: AppColor.black54,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20,),
                      TextFormAuth(
                        controller: controller.indexController,
                        formKey: controller.indexKey,
                        label: '',
                        hint: 'Enter the index',
                        val: 'index cant be empty',
                        icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
                        onFiledSubmit: (String value  ) {

                        },
                        obscure: false,
                        color: AppColor.black54,
                        keyboardType: TextInputType.text,
                      ),
                      const Spacer(),
                      OnBoardingButton(
                        onPressed: () {
                          controller.deleteData();
                        },
                        title: 'Delete Category',
                      )
                    ],
                  ),
                ),
              ],
            ) ,
          ),
        )
    );
  }
}
