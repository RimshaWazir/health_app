import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Application/Services/navigation.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_bloc.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_state.dart';
import 'package:stc_health_app/Data/Datasource/Resources/assets.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';
import 'package:stc_health_app/Data/Datasource/Resources/image.dart';
import 'package:stc_health_app/Presentation/Common/star.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/Product/product.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/product__detail.dart';

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

  ProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return Card(
            elevation: 5,
            child: SizedBox(
              height: 0.73.sh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: state.productModel.length,
                itemBuilder: (context, index) {
                  final data = state.productModel[index];

                  return GestureDetector(
                    onTap: () {
                      Navigate.to(context, const ProductDetail());
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ImageWidget(
                              imageUrl: data.image!,
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Text(
                                    data.id!.toString(),
                                    style: const TextStyle(
                                        fontFamily: "Open Sans",
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  const Spacer(),
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
                          ],
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
                                data.title!,
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
                                data.description!,
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
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const Center(child: Text('items loading hopefully :)'));
      },
    );
  }
}
