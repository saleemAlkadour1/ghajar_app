// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/utils/enums/app_pages_route.dart';
import 'package:ghajar_app/utils/navigation.dart';

class CartScreen extends StatelessWidget implements AppPageRoute {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
      child: Scaffold(
          appBar: CustomAppBar(title: MyStrings.shoppingCart),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.value(25).h),
          )),
    );
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.cartScreen.routeName;
}
