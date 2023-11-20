import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_bloc.dart';
import 'package:stc_health_app/Data/AppData/Bloc/ProductBloc/product_event.dart';
import 'package:stc_health_app/Presentation/Widgets/Auth/Login/login.dart';

List<BlocProvider> appProviders = [
  BlocProvider(
      create: (_) => ProductBloc()..add(GetShoppingItems()),
      child: const LoginPage()),
];
