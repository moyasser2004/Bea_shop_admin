import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../../core/const/text_style.dart';
import 'image_border.dart';


class VListItems extends StatelessWidget {

  final List searchData;
  final double width;
  final double height;
  final dynamic controller;

  const VListItems(
      {Key? key,
        required this.searchData,
        required this.width,
        required this.height,
        this.controller})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: searchData.length,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.grey200,
            ),
            width: width,
            height: height / 5.3,
            child: Stack(
              children: [
               if(searchData[index]["item_top"]==1)Align(
                  alignment: Alignment.centerRight,
                  child: Text("Top  ",style: TextStyle(color: AppColor.red),),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ImageBorder(
                        color: AppColor.grey200!,
                        height: height / 10,
                        image: searchData[index]["items_image"],
                        borderColor: AppColor.black54,
                        padding: 10,
                        margin: 15,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                searchData[index]["items_name"],
                                style: AppTextStyleData.googleAraPey(
                                    color: AppColor.grey800, fontSize: 16),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Text(
                                  searchData[index]["items_des"],
                                  style: TextStyle(
                                    color: AppColor.grey400,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "EGP",
                                        style: TextStyle(color: AppColor.red),
                                      ),
                                      searchData[index]
                                      ["items_discount"] !=
                                          0
                                          ? Text(
                                          " ${(searchData[index]["items_price"] * ((100 - searchData[index]["items_discount"]) / 100)).round()}",
                                          style:
                                          const TextStyle(fontSize: 10))
                                          : Text(
                                          searchData[index]
                                          ["items_price"]
                                              .toString(),
                                          style:
                                          const TextStyle(fontSize: 10))
                                    ],
                                  ),
                                  searchData[index]
                                  ["items_discount"] !=
                                      0
                                      ? Row(
                                    children: [
                                      Text(
                                        "   Was ",
                                        style: TextStyle(
                                          color: AppColor.grey400,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                          searchData[index]
                                          ["items_price"]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColor.grey400,
                                              decoration: TextDecoration
                                                  .lineThrough)),
                                    ],
                                  )
                                      : Container(),
                                  const Spacer(),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      "${DateTime.parse(searchData[index]["items_date"]).year}-${DateTime.parse(searchData[index]["items_date"]).month.toString().padLeft(2, '0')}-${DateTime.parse(searchData[index]["items_date"]).day.toString().padLeft(2, '0')}",
                                      style: const TextStyle(fontSize: 11)),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.grey300),
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Text(
                                      "id: ${searchData[index]["items_id"].toString()}",
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.grey300),
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Text(
                                      "index: $index",
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            )
          )),
    );
  }
}
