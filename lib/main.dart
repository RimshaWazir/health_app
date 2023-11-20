import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_event.dart';
import 'package:stc_health_app/Data/AppData/app_provider.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_bloc.dart';

import 'Presentation/Widgets/Auth/Login/login.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ProductBloc()..add(GetShoppingItems())),
      ...appProviders,
    ],
    child: const MyApp(),
  ));
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
          home: const LoginPage(),
          // Example of using ProductListView
          // home: const ProductListView(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
