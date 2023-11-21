import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_health_app/Application/Services/Navigation/navigation.dart';
import 'package:stc_health_app/Data/DataSource/Extensions/extensions.dart';
import 'package:stc_health_app/Data/DataSource/Resources/assets.dart';
import 'package:stc_health_app/Data/DataSource/Resources/color.dart';
import 'package:stc_health_app/Data/DataSource/Resources/imports.dart';
import 'package:stc_health_app/Data/DataSource/Resources/strings.dart';
import 'package:stc_health_app/Data/DataSource/Resources/styles.dart';
import 'package:stc_health_app/Data/DataSource/Resources/validator.dart';
import 'package:stc_health_app/Presentation/Common/app_button.dart';
import 'package:stc_health_app/Presentation/Common/app_text.dart';
import 'package:stc_health_app/Presentation/Common/custom_text_field.dart';
import 'package:stc_health_app/Presentation/Common/widget_functions.dart';
import 'package:stc_health_app/Presentation/Widgets/Auth/Controller/login_cubit.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/BottomNavigation/bottom_navigation_screen.dart';
import 'package:stc_health_app/Presentation/Widgets/locale_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool iconVisible = true;
  bool? checkTheMark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 1.sh / 2.3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [AppColors.primaryColor, AppColors.darkPrimaryColor],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Align(
                          child: AppText(
                        AppStrings.stcHealth,
                        style: Styles.openSansStdMedium(context,
                            fontSize: 35.sp, color: AppColors.whiteColor),
                        maxLine: 2,
                      )),
                    ),
                  ),
                  BlocBuilder<LocaleCubit, bool?>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: state == true ? 20.0.sp : 0.sp,
                            bottom: 30.sp,
                            right: state == false ? 20.0.sp : 0.sp),
                        child: Align(
                            alignment: state == true
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: AppText(
                              AppStrings.login.tr(),
                              style: Styles.openSansStdBold(context,
                                  fontSize: 25.sp),
                              maxLine: 1,
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
            50.y,
            Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.sp),
                  child: BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is LoginSuccess) {
                        Navigate.pop(context);
                        WidgetFunctions.instance.snackBar(context,
                            text: 'Login Successfully!',
                            bgColor: AppColors.primaryColor);

                        Navigate.toReplaceAll(
                            context, const BottomNavigationScreen());
                      }
                      if (state is LoginError) {
                        Navigate.pop(context);
                        WidgetFunctions.instance.snackBar(context,
                            text: state.error, bgColor: AppColors.primaryColor);
                      }
                    },
                    child: Column(
                      children: [
                        CustomTextFieldWithOnTap(
                          controller: emailController,
                          hintText: 'Enter Email'.tr(),
                          validator: Validate.email,
                          hintTextColor: AppColors.greyColor,
                          textInputType: TextInputType.text,
                          titleTextColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              checkTheMark = Validate().isEmailValid(val);
                            });
                          },
                          suffixIcon: checkTheMark == true
                              ? SvgPicture.asset(Assets.checkMarkIcon)
                              : checkTheMark == false
                                  ? SvgPicture.asset(Assets.checkCrossIcon)
                                  : null,
                          labelText: 'Email'.tr(),
                        ),
                        CustomTextFieldWithOnTap(
                          controller: passwordController,
                          hintText: '******'.tr(),
                          labelText: 'Password'.tr(),
                          textInputType: TextInputType.visiblePassword,
                          titleTextColor: Colors.black,
                          hintTextColor: AppColors.greyColor,
                          obscureText: iconVisible,
                          borderRadius: 2.r,
                          suffixIcon: InkWell(
                              onTap: () {
                                iconVisible = !iconVisible;
                                setState(() {});
                              },
                              child: Icon(iconVisible == true
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          validator: Validate.password,
                        ),
                        10.y,
                        CustomButton(
                            verticalMargin: 20,
                            height: 50.sp,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                var body = {
                                  "email": emailController.text,
                                  "password": passwordController.text
                                };

                                context.read<LoginCubit>().loginIt(body);
                              } else {}
                            },
                            text: AppStrings.continueString.tr()),
                        CustomButton(
                          onTap: () {
                            Navigate.to(
                                context, const BottomNavigationScreen());
                          },
                          text: AppStrings.needHelp.tr(),
                          bgColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          textColor: AppColors.blackColor,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
