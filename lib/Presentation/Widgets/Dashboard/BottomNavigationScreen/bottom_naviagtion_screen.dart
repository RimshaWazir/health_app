// import 'package:flutter/material.dart';
 
// import 'package:flutter_screenutil/flutter_screenutil.dart';
 
// class BottomNavigationScreen extends StatefulWidget {
//   const BottomNavigationScreen({
//     super.key,
//   });

//   @override
//   State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
// }

// class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
//   PageController pageController = PageController(initialPage: 0);
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: scaffoldKey,
//         appBar: CustomAppBar(
//           pageController: pageController,
//           onSearchTap: () {
//             Navigate.to(
//                 context,
//                 SearchScreen(
//                   isGuest: widget.isGuest,
//                 ));
//           },
//           onNotificationTap: () {
//             if (widget.isGuest == true) {
//               showLoginDialog(context);
//             } else {
//               Navigate.to(context, const NotificationScreen());
//             }
//           },
//           onBackTap: () {
//             scaffoldKey.currentState!.openDrawer();
//           },
//         ),
//         drawer: AppDrawer(isGuest: widget.isGuest!, drawerKey: scaffoldKey),
//         body: SizedBox(
//           height: 1.sh,
//           width: 1.sw,
//           child: PageView(
//             controller: pageController,
//             physics: widget.isGuest == true
//                 ? const NeverScrollableScrollPhysics()
//                 : const ClampingScrollPhysics(),
//             onPageChanged: (x) {
//               BottomNotifier.bottomNavigationNotifier.value = x;
//             },
//             children: [
//               HomeScreen(
//                   pageController: pageController, isGuest: widget.isGuest),
//               const DashboardBottom(),
//               ProductScreen(
//                   isGuest: widget.isGuest, pageController: pageController),
//               CartScreen(
//                   pageController: pageController, isGuest: widget.isGuest),
//               ProfileScreen(
//                 isGuest: widget.isGuest!,
//               )
//             ],
//           ),
//         ),
//         bottomNavigationBar: ValueListenableBuilder(
//           builder: (context, state, child) {
//             return Container(
//               width: 375.0,
//               height: 84.0.sp,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.06),
//                     offset: const Offset(0, 0),
//                     blurRadius: 10.0,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         BottomNotifier.bottomNavigationNotifier.value = 0;
//                         pageController.jumpToPage(0);
//                       },
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: SvgPicture.asset(
//                                 Assets.homeIcon,
//                                 color: state == 0
//                                     ? AppColors.primaryColor
//                                     : const Color(0xffA7A7A7),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.sp,
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: FittedBox(
//                                 fit: BoxFit.scaleDown,
//                                 child: AppText(
//                                   'Home',
//                                   style: Styles.circularStdRegular(
//                                     context,
//                                     fontSize: 13.0.sp,
//                                     color: state == 0
//                                         ? AppColors.primaryColor
//                                         : const Color(0xffA7A7A7),
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),

//                   ///1
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         if (widget.isGuest == true) {
//                           showLoginDialog(context);
//                         } else {
//                           BottomNotifier.bottomNavigationNotifier.value = 1;
//                           pageController.jumpToPage(1);
//                         }
//                       },
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: SvgPicture.asset(
//                                 Assets.dashboardBottomIcon,
//                                 color: state == 1
//                                     ? AppColors.primaryColor
//                                     : const Color(0xffA7A7A7),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.sp,
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: FittedBox(
//                                 fit: BoxFit.scaleDown,
//                                 child: AppText(
//                                   'Dashboard',
//                                   style: Styles.circularStdRegular(
//                                     context,
//                                     fontSize: 13.0.sp,
//                                     color: state == 1
//                                         ? AppColors.primaryColor
//                                         : const Color(0xffA7A7A7),
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),

//                   ///2
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         BottomNotifier.bottomNavigationNotifier.value = 2;
//                         pageController.jumpToPage(2);
//                       },
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: SvgPicture.asset(
//                                 Assets.productIcon,
//                                 color:
//                                     state == 2 ? AppColors.primaryColor : null,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.sp,
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: FittedBox(
//                                 fit: BoxFit.scaleDown,
//                                 child: AppText(
//                                   'Products',
//                                   style: Styles.circularStdRegular(
//                                     context,
//                                     fontSize: 13.0.sp,
//                                     color: state == 2
//                                         ? AppColors.primaryColor
//                                         : const Color(0xffA7A7A7),
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),

//                   ///3
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         if (widget.isGuest == true) {
//                           showLoginDialog(context);
//                         } else {
//                           BottomNotifier.bottomNavigationNotifier.value = 3;
//                           pageController.jumpToPage(3);
//                         }
//                       },
//                       child: BlocBuilder<CartCubit, CartState>(
//                         builder: (context, cartState) {
//                           int count = 0;
//                           if (cartState is CartLoaded) {
//                             count = cartState.cartData.length;
//                           }
//                           return Column(
//                             children: [
//                               Expanded(
//                                 child: Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: badges.Badge(
//                                     badgeContent: Text(
//                                       count == 0 ? '' : count.toString(),
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 11.sp,
//                                       ),
//                                     ),
//                                     child: SvgPicture.asset(
//                                       Assets.cartIcon,
//                                       color: state == 3
//                                           ? AppColors.primaryColor
//                                           : const Color(0xffA7A7A7),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5.sp,
//                               ),
//                               Expanded(
//                                 child: Align(
//                                   alignment: Alignment.topCenter,
//                                   child: FittedBox(
//                                     fit: BoxFit.scaleDown,
//                                     child: AppText(
//                                       'Cart',
//                                       style: Styles.circularStdRegular(
//                                         context,
//                                         fontSize: 13.0.sp,
//                                         color: state == 3
//                                             ? AppColors.primaryColor
//                                             : const Color(0xffA7A7A7),
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ),

//                   ///4
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         BottomNotifier.bottomNavigationNotifier.value = 4;
//                         pageController.jumpToPage(4);
//                       },
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: SvgPicture.asset(
//                                 Assets.profileIcon,
//                                 color: state == 4
//                                     ? AppColors.primaryColor
//                                     : const Color(0xffA7A7A7),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.sp,
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               child: FittedBox(
//                                 fit: BoxFit.scaleDown,
//                                 child: AppText(
//                                   'Profile',
//                                   style: Styles.circularStdRegular(
//                                     context,
//                                     fontSize: 13.0.sp,
//                                     color: state == 4
//                                         ? AppColors.primaryColor
//                                         : const Color(0xffA7A7A7),
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           valueListenable: BottomNotifier.bottomNavigationNotifier,
//         ));
//   }
// }
