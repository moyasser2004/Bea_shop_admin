import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const/app_color.dart';
import '../../../core/const/app_link.dart';

class ImageBorder extends StatelessWidget {
  final double padding;
  final double margin;
  final String image;
  final Color borderColor;
  final Color color;
  final double height;

  const ImageBorder({
    Key? key,
    this.padding = 10,
    this.margin = 15,
    required this.image,
    required this.borderColor,
    required this.height,
     required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      child:Center(
        child: CachedNetworkImage(
            imageUrl: image.toString().contains("firebasestorage")?
            image:AppLink.categoryImage(image),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColor.grey200!,
              highlightColor: AppColor.primary,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(Icons.error,color: AppColor.red,),
            )

        )
      )
    );
  }
}
