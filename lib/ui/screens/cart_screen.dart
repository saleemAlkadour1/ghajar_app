import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/my_strings.dart';
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
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final double widthScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.shoppingCart,
        heightScreen: heightScreen,
        widthScreen: widthScreen,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
        child: Column(
          children: [
            AppSpacing.value(25).inColumn,
            SizedBox(
              height: AppSpacing.value(300).h,
              child: const CustomListViewInCartScreen(),
            ),
            AppSpacing.value(31).inColumn,
            const PaymentSummaryCard(),
            const Spacer(),
            CustomButton(
              text: MyStrings.completeTheRequest,
              heightScreen: heightScreen,
              widthScreen: widthScreen,
            ),
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
