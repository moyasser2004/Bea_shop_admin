import 'package:bea_admin/controller/category_controller/add_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const/app_color.dart';
import '../../core/const/text_style.dart';
import '../widget/botton.dart';
import '../widget/text_form.dart';



class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddCategoryController());
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Add New category",style: AppTextStyleData.googleAraPey(fontSize: 22,fontWeight:FontWeight.w600,color: AppColor.black54 ),textAlign: TextAlign.center,)
        ),
        const SizedBox(height: 30,),
        TextFormAuth(
          controller: controller.nameArController,
          formKey: controller.nameArKey,
          label: '',
          hint: 'Category Ar Name ....',
          val: 'Category Ar Name cant be empty',
          icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
          onFiledSubmit: (String value  ) {},
          obscure: false,
          color: AppColor.black54,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20,),
        TextFormAuth(
          controller: controller.nameEnController,
          formKey: controller.nameEnKey,
          label: '',
          hint: 'Category En Name ....',
          val: 'Category En Name cant be empty',
          icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
          onFiledSubmit: (String value  ) {},
          obscure: false,
          color: AppColor.black54,
          keyboardType: TextInputType.text,
        ),
        const Spacer(),
        OnBoardingButton(
          onPressed: () {
            controller.getIcon();
          },
          title: 'Add Category Icon',
        ),
        const SizedBox(height: 5,),
        OnBoardingButton(
          onPressed: () {
            controller.getImage();
          },
          title: 'Add Category Image',
        ),
        const SizedBox(height: 5,),
        OnBoardingButton(
          onPressed: () {
            controller.toDeleteCategory();
          },
          title: 'Delete Category ',
        ),
        const Spacer(),
        OnBoardingButton(
          onPressed: () {
            controller.insertData();
          },
          title: 'Add Category ',
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
