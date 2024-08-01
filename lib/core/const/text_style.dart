import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTextStyleData {

  static TextStyle? theme(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? titleMedium(BuildContext context,[double fontSize=20,Color color=Colors.black]) {
    return theme(context)!.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle? bodyMedium(BuildContext context,[double fontSize=17]) {
    return theme(context)!.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: Colors.black54,
      height: 2,
    );
  }

  static TextStyle? bodyMedium2(BuildContext context,[double fontSize=15]) {
    return  TextStyle(
      fontSize: fontSize,
      color: Colors.black54,
      height: 2,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? buttonText(BuildContext context) {
    return theme(context)!.copyWith(
      fontSize: 14,
      color: Colors.white,
    );
  }

  static TextStyle? buttonTextOnBoarding(BuildContext context) {
    return theme(context)!.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
    );
  }

  static TextStyle? googleAraPey({
    double fontSize = 37,
    FontWeight fontWeight = FontWeight.bold,
    Color? color = Colors.blue,
  }) {
    return GoogleFonts.arapey(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 1,
    );
  }

  static TextStyle? googleRobotoSlab({
    Color color = Colors.blue,
    double fontSize = 20,
  }) {
    return GoogleFonts.robotoSlab(color: color,fontSize: fontSize,);
  }

  static TextStyle? googleAmIri({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color ?color = Colors.blue,
  }) {
    return GoogleFonts.amiri(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
