import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_config.dart';
import 'package:ghajar_app/ui/screens/welcome_screen.dart';

class GhajarApp extends StatelessWidget {
  const GhajarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConfig.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: WelcomeScreen(),
          ),
        );
      },
    );
  }
}
