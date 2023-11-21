import 'package:stc_health_app/Data/DataSource/Resources/color.dart';
import 'package:stc_health_app/Data/DataSource/Resources/imports.dart';
import 'package:stc_health_app/Data/DataSource/Resources/styles.dart';
import 'package:stc_health_app/Presentation/Common/app_text.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Center(
            child: AppText('Favourite Page',
                style: Styles.openSansStdBold(context,
                    color: AppColors.darkPrimaryColor))),
      ),
    );
  }
}
