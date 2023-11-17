import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool? enabled;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final double? buttonHeight;
  final double? buttonWidth;
  final int? textlength;
  final String? limittext;
  final String? counterText;
  final TextStyle? counterStyle;
  final VoidCallback? onTap;
  final TextAlign textAlign;
  final bool? dense;

  // String inputformatername;
  const DefaultTextField({
    super.key,
    this.onTap,
    this.controller,
    this.hintText,
    this.dense,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.enabled,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.textStyle,
    this.hintStyle,
    this.prefixIcon,
    this.buttonHeight,
    this.buttonWidth,
    this.textlength,
    this.limittext,
    // this.inputFormatters = "[A-Za-z0-9@-_/., ']",b
    this.inputFormatters,
    this.counterText,
    this.counterStyle,
    this.textAlign = TextAlign.start,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,

      cursorColor: AppColors.blue,
      style: textStyle,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(
      //       RegExp(inputformatername.toString())),
      // ],
      controller: controller,

      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      minLines: minLines,
      maxLines: maxLines,

      maxLength: textlength,

      decoration: InputDecoration(
        isDense: dense,
        hintStyle: hintStyle,
        labelText: labelText,
        hintText: hintText,
        counterText: counterText,
        counterStyle: counterStyle,
        suffixText: limittext,

        contentPadding: EdgeInsets.only(left: 5.w, bottom: 3.5.h),
        fillColor: AppColors.greyColor,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: Colors.transparent),
        // ),
        // errorText: "abc",
        // errorStyle: TextStyle(color: Colors.red),
      ),
    );
  }
}
