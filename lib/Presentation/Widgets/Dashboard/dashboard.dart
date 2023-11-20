import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Application/Services/navigation.dart';
import 'package:stc_health_app/Data/Datasource/Resources/strings.dart';
import 'package:stc_health_app/Presentation/Common/product_listview.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/product__detail.dart';

import '../../../Data/Datasource/Resources/color_pallete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  offset: const Offset(0, 0),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          height: 0.1.sh,
          child: const Center(
              child: Text(
            AppStrings.allProducts,
            style: TextStyle(
                fontFamily: "Open Sans",
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.darkblue),
            textAlign: TextAlign.center,
          )),
        ),
        SizedBox(
          height: 7.sp,
        ),
        ProductListView()
      ],
    );
  }
}
