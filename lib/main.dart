import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:stc_health_app/Data/AppData/app_preferences.dart';
import 'package:stc_health_app/Data/AppData/app_providers.dart';
import 'package:stc_health_app/Data/DataSource/Resources/color.dart';
import 'package:stc_health_app/Presentation/Widgets/Auth/login_screen.dart';

import 'Data/DataSource/Resources/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  await SharedPrefs.init();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('ar', 'AR'),
        Locale('ur', 'UR'),
      ],
      saveLocale: true,
      startLocale: const Locale('en', 'EN'),
      path: 'assets/10ln',
      child: MultiBlocProvider(providers: appProviders, child: const MyApp())));
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(primaryColor: AppColors.primaryColor),
            home: const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
