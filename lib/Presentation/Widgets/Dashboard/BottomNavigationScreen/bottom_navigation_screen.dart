import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/FavouriteScreen/favourite_screen.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/PersonalScreen/personal_screen.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/Product/product.dart';
import 'package:stc_health_app/Presentation/Widgets/Dashboard/dashboard.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Product(),
    const FavouriteScreen(),
    const PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            height: 0.1.sh,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
            ),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.greyColor,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory_2_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
