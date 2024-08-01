import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/const/text_style.dart';


class TextFormAuth extends StatelessWidget {

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final TextInputType  keyboardType;
  final Function(String) onFiledSubmit;
  final void Function()? onTap;

  final String label;
  final String hint;
  final String val;
  final Widget icon;
  final bool obscure ;
  final Color color;
  final Color colorLabel;
  final int mine;
  final double r;
  final double l;
  final double v;
  final double h;


  const TextFormAuth({
    Key? key,
    required this.controller,
    required this.formKey,
    required this.label,
    required this.hint,
    required this.val,
    required this.icon,
    required this.onFiledSubmit,
    required this.obscure,
    required this.color,
    required this.keyboardType,
    this.mine=1,
    this.r=25,
    this.l=25,
    this.v=15,
    this.h=15,
    this.colorLabel = Colors.blue, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(r, 0, l, 0),
      child: Form(
        key: formKey,
        child: TextFormField(
            onTap: onTap,
            onTapOutside: (event)=>FocusManager.instance.primaryFocus?.unfocus(),
            obscureText: obscure,
            maxLines: 1,
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: color,
                fontSize: 14
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
              EdgeInsets.symmetric(vertical: v, horizontal: h),
              labelText: label,
              hintText: hint,
              hintStyle: GoogleFonts.arapey(
                color: color,
              ),
              labelStyle: AppTextStyleData.googleRobotoSlab(color:colorLabel ,fontSize: 15),
              suffixIcon: icon,
              enabled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 3)),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty|| value.length< mine ) {
                return val;
              }
              return null;
            },
            onFieldSubmitted: onFiledSubmit
        ),
      ),
    );
  }
}
