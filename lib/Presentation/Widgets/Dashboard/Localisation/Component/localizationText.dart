import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:stc_health_app/Data/AppData/app_preferences.dart';
import 'package:stc_health_app/Data/DataSource/Resources/color.dart';

import 'package:stc_health_app/Presentation/Widgets/locale_cubit.dart';

class LanguageDropDownWidget extends StatefulWidget {
  final Color? textColor;
  const LanguageDropDownWidget({Key? key, this.textColor}) : super(key: key);

  @override
  State<LanguageDropDownWidget> createState() => _LanguageDropDownWidgetState();
}

class _LanguageDropDownWidgetState extends State<LanguageDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, bool?>(
      builder: (context, isEnglish) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          alignment: isEnglish! ? Alignment.centerLeft : Alignment.centerRight,
          child: InkWell(
            onTap: () async {
              switch (isEnglish) {
                case false:
                  const newLocale = Locale('en', 'EN');
                  await context.setLocale(newLocale);
                  Get.updateLocale(newLocale);
                  SharedPrefs().setLocale(langLocale: true);
                  SharedPrefs().getLocale().then((value) {
                    BlocProvider.of<LocaleCubit>(context)
                        .setLocale(value: value);
                  });

                  break;
                case true:
                  const newLocale = Locale('ar', 'AR');

                  await context.setLocale(newLocale);
                  Get.updateLocale(newLocale);
                  SharedPrefs().setLocale(langLocale: false);
                  SharedPrefs().getLocale().then((value) {
                    BlocProvider.of<LocaleCubit>(context)
                        .setLocale(value: value);
                  });

                  break;
              }
            },
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                isEnglish ? "Arabic" : "English",
                style: TextStyle(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
