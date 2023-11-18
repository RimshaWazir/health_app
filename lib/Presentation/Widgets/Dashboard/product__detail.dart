import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Data/Datasource/Resources/assets.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';
import 'package:stc_health_app/Presentation/Common/star.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool extend = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(Assets.background)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40.sp,
                          width: 40.sp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        Container(
                          height: 40.sp,
                          width: 40.sp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    const Text(
                      "Details ",
                      style: TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: extend ? 0.300.sh : 0.475.sh,
                    ),
                    const Text(
                      "0000 AED",
                      style: TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff2a3f4b),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                height: extend ? 0.475.sh : 0.3.sh,
                width: 1.sw,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            extend = !extend;
                          });
                        },
                        icon: Icon(
                            extend
                                ? Icons.keyboard_arrow_down_outlined
                                : Icons.keyboard_arrow_up_outlined,
                            color: AppColors.blue),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 3,
                            child: Container(
                              height: 40.sp,
                              width: 40.sp,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(Icons.ios_share_outlined,
                                    color: AppColors.blue),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.sw,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.blue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff444b51),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                        style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff838396),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Visibility(
                        visible: extend,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.sp,
                            ),
                            Container(
                              height: 0.15.sh,
                              decoration: BoxDecoration(
                                  color: AppColors.pinkishColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Reviews (100)",
                                      style: TextStyle(
                                        fontFamily: "Open Sans",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff444b51),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 21),
                                        Text(
                                          "4.33",
                                          style: TextStyle(
                                            fontFamily: "Open Sans",
                                            fontSize: 32,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: 30),
                                        Row(
                                          children: [
                                            Star(),
                                            Star(),
                                            Star(),
                                            Star(),
                                            Star(),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
