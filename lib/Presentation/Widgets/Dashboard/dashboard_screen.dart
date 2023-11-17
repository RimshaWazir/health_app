import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stc_health_app/Data/Datasource/Resources/color_pallete.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bottom Navigation Bar'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 0.1.sh,
        decoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(20)),
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
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: ' ',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Explore Screen'),
    );
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favourite Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
