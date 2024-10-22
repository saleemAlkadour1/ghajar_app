import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.heightScreen,
    required this.widthScreen,
  });
  final String text;
  final void Function()? onTap;
  final double heightScreen;
  final double widthScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.regular.v)),
        width: widthScreen,
        height: heightScreen * 0.07,
        child: Center(
            child: Text(
          text,
          style: MyText.appStyle.small.wBold.reColorWhite.style,
        )),
      ),
    );
  }
}
