import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/dashboard_screen.dart';

import 'Presentation/Widgets/Auth/Login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'STC HEALTH',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: const MyHomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
