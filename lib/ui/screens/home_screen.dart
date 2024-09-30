// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/bottom_navigation_bar_item.dart';
import 'package:ghajar_app/utils/enums/app_pages_route.dart';
import 'package:ghajar_app/utils/navigation.dart';

class HomeScreen extends StatefulWidget implements AppPageRoute {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.homeScreen.routeName;
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
      data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          customBottomNavigationBarItem(
            index: 0,
            selectedIndex: selectedIndex,
            title: MyStrings.favorite,
            pathImage: 'assets/images/app_icons/heart.svg',
          ),
          customBottomNavigationBarItem(
            index: 1,
            selectedIndex: selectedIndex,
            title: MyStrings.catalog,
            pathImage: 'assets/images/app_icons/sort.svg',
          ),
          customBottomNavigationBarItem(
            index: 2,
            selectedIndex: selectedIndex,
            title: MyStrings.cart,
            pathImage: 'assets/images/app_icons/cart.svg',
          ),
          customBottomNavigationBarItem(
            index: 3,
            selectedIndex: selectedIndex,
            title: MyStrings.main,
            pathImage: 'assets/images/app_icons/home.svg',
          ),
        ],
      ),
    ));
  }
}
