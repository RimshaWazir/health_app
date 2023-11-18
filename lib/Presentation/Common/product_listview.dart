import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Data/Datasource/Resources/assets.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';
import 'package:stc_health_app/Presentation/Common/star.dart';

class ProductListView extends StatelessWidget {
  final List<ImageProvider> productImages = [
    const AssetImage(Assets.shoes),
    const AssetImage(Assets.suits),
    const AssetImage(Assets.shoes),
    const AssetImage(Assets.suits),
    const AssetImage(Assets.shoes),
    const AssetImage(Assets.suits),
    const AssetImage(Assets.shoes),
  ];

  String text;
  String model;
  String detail;

  ProductListView({
    required this.model,
    required this.detail,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.73.sh,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  height: 0.2.sh,
                  width: 0.86.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: productImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.81, vertical: 10.81),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model,
                          style: const TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                          textAlign: TextAlign.left,
                        ),
                        const Row(
                          children: [
                            Star(),
                            Star(),
                            Star(),
                            Star(),
                            Star(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18.sp,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff444b51),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      detail,
                      style: const TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkblue),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 7.sp,
                    ),
                    Divider(
                      color: AppColors.greyColor,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
