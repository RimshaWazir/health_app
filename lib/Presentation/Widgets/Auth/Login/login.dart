import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';
import 'package:stc_health_app/Data/Datasource/Resources/email_validator_extension.dart';
import 'package:stc_health_app/Data/Datasource/Resources/strings.dart';
import 'package:stc_health_app/Presentation/Widgets/Auth/Component/textformfield_decoration.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/BottomNavigationScreen/bottom_navigation_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Container(
                    height: 0.46.sh,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.navy, AppColors.blue],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.1.sh),
                        const Text(
                          AppStrings.stcHealth,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 70.h),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              AppStrings.login,
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5.sh,
                    width: 1.sw,
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (input) => input!.isValidEmail()
                                ? null
                                : "Check your email",
                            controller: _emailController,
                            decoration: TextFormFieldDecoration(
                              "example@gmail.com",
                              const Icon(Icons.email_outlined),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            obscureText: _obscureText,
                            validator: (input) =>
                                EmailValidator.validatorPassword(input),
                            controller: _passwordController,
                            onTap: () {},
                            decoration: TextFormFieldDecoration(
                              "********",
                              IconButton(
                                icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: _obscureText
                                        ? AppColors.greyColor
                                        : AppColors.blue),
                                onPressed: () {
                                  setState(() {
                                    _toggle();
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: 0.7.sw,
                            height: 0.07.sh,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  print('Email: ${_emailController.text}');
                                  print(
                                      'Password: ${_passwordController.text}');
                                  FocusScope.of(context).unfocus();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavigationScreen()),
                                  );
                                }
                              },
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
                                AppStrings.continueText,
                                style: TextStyle(
                                    fontFamily: "SF Pro Display",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "NEED HELP?",
                            style: TextStyle(
                                fontFamily: "SF Pro Text",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
