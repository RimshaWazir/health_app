import 'package:easy_localization/easy_localization.dart';
import 'package:stc_health_app/Data/DataSource/Extensions/extensions.dart';
import 'package:stc_health_app/Data/DataSource/Resources/color.dart';
import 'package:stc_health_app/Data/DataSource/Resources/imports.dart';
import 'package:stc_health_app/Data/DataSource/Resources/styles.dart';
import 'package:stc_health_app/Presentation/Common/app_text.dart';

import 'Component/localizationText.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 110.sp,
            width: 1.sw,
            child: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 1.h,
                    top: 20,
                    child: const SizedBox(
                        height: 100,
                        width: 70,
                        child: LanguageDropDownWidget())),
              ],
            ),
          ),
          50.y,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: AppText('LocalizedTest'.tr(),
                maxLine: 20,
                style: Styles.openSansStdMedium(context,
                    color: AppColors.blackColor)),
          )
        ],
      ),
    );
  }
}
