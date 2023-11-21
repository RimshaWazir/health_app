import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stc_health_app/Data/DataSource/Extensions/extensions.dart';
import 'package:stc_health_app/Data/DataSource/Resources/color.dart';
import 'package:stc_health_app/Data/DataSource/Resources/imports.dart';
import 'package:stc_health_app/Data/DataSource/Resources/styles.dart';
import 'package:stc_health_app/Domain/Models/ProductModels/product_model.dart';
import 'package:stc_health_app/Presentation/Common/app_text.dart';
import 'package:stc_health_app/Presentation/Common/custom_rating_bar.dart';
import 'package:stc_health_app/Presentation/Widgets/locale_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel pd;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.pd, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 362.w,
        height: 330.h,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  width: 362.w,
                  height: 216.08.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(pd.image.toString()),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.sp,
                            ),
                            Material(
                                color:
                                    AppColors.lightGreyColor.withOpacity(0.4),
                                child: AppText(pd.price.toString(),
                                    style: Styles.openSansStdBold(context,
                                        fontSize: 16.sp))),
                            Material(
                                color:
                                    AppColors.lightGreyColor.withOpacity(0.4),
                                child: AppText('AED',
                                    style: Styles.openSansStdBold(context,
                                        fontSize: 16.sp))),
                            const Spacer(),
                            CustomRating(
                              onRatingUpdate: (d) {},
                              initialRating: pd.rating?.rate ?? 5,
                              iconSize: 2.sp,
                              iconsPaddingHorizontal: 0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.y,
              BlocBuilder<LocaleCubit, bool?>(
                builder: (context, lState) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: lState == true ? 3.0 : 0,
                        right: lState == false ? 18 : 0),
                    child: Align(
                        alignment: lState == true
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: AppText(
                          pd.title.toString(),
                          style: Styles.openSansStdMedium(context,
                              fontSize: 13.sp, color: AppColors.blackColor),
                          maxLine: 1,
                        )),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: AppText(
                  pd.description.toString(),
                  style: Styles.openSansRegular(context,
                      fontSize: 13.sp, color: AppColors.blackColor),
                  maxLine: 2,
                ),
              ),
              4.y,
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
