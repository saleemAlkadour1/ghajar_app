// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/custom_list_view_in_cart_screen.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/payment_summary_card.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/ui/widgets/custom_button.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class CartScreen extends ConsumerWidget implements AppPageRoute {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(title: Translations.shoppingCart),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
        child: Column(
          children: [
            AppSpacing.value(25).inColumn,
            SizedBox(
              height: AppSpacing.value(300).h,
              child: CustomListViewInCartScreen(),
            ),
            AppSpacing.value(31).inColumn,
            PaymentSummaryCard(),
            Spacer(),
            CustomButton(text: 'أكمل الطلب'),
            AppSpacing.value(10).inColumn
          ],
        ),
      ),
    );
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.cartScreen.routeName;
}
