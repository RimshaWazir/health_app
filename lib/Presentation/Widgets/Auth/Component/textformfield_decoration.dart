import 'package:flutter/material.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';

InputDecoration TextFormFieldDecoration(
  String hinttext,
  Widget icon,
) {
  return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      suffixIcon: icon,
      hintText: hinttext,
      enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.greyLightColor, width: 1),
          borderRadius: BorderRadius.circular(8)),
      border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.greyLightColor, width: 0.5),
          borderRadius: BorderRadius.circular(8)));
}
