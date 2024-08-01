import 'package:flutter/material.dart';

import '../../core/const/app_color.dart';
import '../../core/const/text_style.dart';


class OnBoardingButton extends StatelessWidget {

  final  void Function()? onPressed;
  final String title;

  const OnBoardingButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColor.primary,
            padding: const EdgeInsets.symmetric(horizontal: 5)),
        child: SizedBox(
            width: double.infinity,
            child: Text(
                title,
              style: AppTextStyleData.googleAmIri(fontSize: 17,color: AppColor.white
              ),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}