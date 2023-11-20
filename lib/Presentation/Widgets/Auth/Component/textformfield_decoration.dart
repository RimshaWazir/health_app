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
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyLightColor, width: 1),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyLightColor, width: 0.5),
      ));
}
