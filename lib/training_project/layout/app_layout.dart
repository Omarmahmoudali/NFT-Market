import 'package:flutter/material.dart';
import 'package:testapp/training_project/screens/categories_screen.dart';
import 'package:testapp/training_project/screens/home_screen.dart';
import 'package:testapp/training_project/screens/profile_screen.dart';
import 'package:testapp/training_project/screens/team_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
    const TeamName(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const Image(image: AssetImage('assets/images/ecommercelogo.png')),
        title: const Text('E commerce'),
      ),
      body: bottomScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          fixedColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            changeBottom(index);
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'profile'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                ),
                label: 'Team'),
          ]),
    );
  }

  void changeBottom(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
