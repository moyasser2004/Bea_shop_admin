import 'package:bea_admin/core/const/app_color.dart';
import 'package:bea_admin/core/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller/add_product_controller.dart';
import '../widget/botton.dart';
import '../widget/text_form.dart';


class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddProductController controller = Get.put(AddProductController());
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return  SingleChildScrollView(
      child: SizedBox(
        width:width ,
        height: height*1.1,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Add New Product",style: AppTextStyleData.googleAraPey(fontSize: 22,fontWeight:FontWeight.w600,color: AppColor.black54 ),textAlign: TextAlign.center,)
            ),
            GetBuilder<AddProductController>(
              builder: (con) =>  DropdownButton(
                items:  [1,2,3,4,5,6,7,8].
                map((e)=>DropdownMenuItem(
                  value: e,
                  child: e==1?const Text("Phone Category"): e==2?const Text("Laptop Category"): e==3?const Text("Clothes Category"): e==4?const Text("SuperMarket Category")
                      : e==5?const Text("Toys Category"): e==6?const Text("Meet Category"): e==7?const Text("Fruits Category"): const Text("Vegetable Category")
                )
                ).toList(),
                onChanged:con.changeCategory,
                value:con.category ,
              ),

            ),
            TextFormAuth(
              controller: controller.nameArController,
              formKey: controller.nameArKey,
              label: '',
              hint: 'PR Ar Name ....',
              val: 'R Ar Name cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.nameEnController,
              formKey: controller.nameEnKey,
              label: '',
              hint: 'PR En Name ....',
              val: 'R Er Name cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.desArController,
              formKey: controller.desArKey,
              label: '',
              hint: 'PR Ar Des ....',
              val: 'PR Ar Des cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.desEnController,
              formKey: controller.desEnKey,
              label: '',
              hint: 'PR En Des ....',
              val: 'PR En Des cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.countController,
              formKey: controller.countKey,
              label: '',
              hint: 'PR  Count ....',
              val: 'PR  Count cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.priceController,
              formKey: controller.priceKey,
              label: '',
              hint: 'PR  Price ....',
              val: 'PR  Price cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.discountController,
              formKey: controller.discountKey,
              label: '',
              hint: 'PR  Discount ....',
              val: 'PR  Discount cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.countController,
              formKey: controller.colorKey,
              label: '',
              hint: 'PR  Color ....',
              val: 'PR  Color cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {

              },
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormAuth(
              controller: controller.ownerController,
              formKey: controller.ownerKey,
              label: '',
              hint: 'PR  Owner Number ....',
              val: 'PR  Owner Number cant be empty',
              icon:  Icon(Icons.production_quantity_limits_outlined,color: AppColor.primaryLight,),
              onFiledSubmit: (String value  ) {},
              obscure: false,
              color: AppColor.black54,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10,),
           GetBuilder<AddProductController>(
             builder: (con) =>  Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Row(
                   children: [
                     Text("Product Activity",style: AppTextStyleData.googleAmIri(fontSize: 14,color: AppColor.black),),
                     Checkbox(
                         activeColor: AppColor.primaryLight,
                         value: con.activeCheckBox,
                         onChanged: con.changActive
                     ),

                   ],
                 ),
                 Row(
                   children: [
                     Text("Product Top",style: AppTextStyleData.googleAmIri(fontSize: 14,color: AppColor.black),),
                     Checkbox(
                         activeColor: AppColor.primaryLight,
                         value: con.topCheckBox,
                         onChanged: con.changTop
                     ),

                   ],
                 ),
               ],
             )

           ),
            const SizedBox(height: 10,),
            OnBoardingButton(
                title: 'Select Image ',
                onPressed: controller.imagePicker
            ),
            const SizedBox(height: 10,),
            OnBoardingButton(
                title: ' Add Item ',
                onPressed:(){
                  controller.addItem();
                }
            ),
            const SizedBox(height: 10,),
            OnBoardingButton(
                title: ' Delete Item ',
                onPressed:(){
                  controller.toDeleteScreen();
                }
            ),


          ],
        ),
      ),
    );
  }
}
