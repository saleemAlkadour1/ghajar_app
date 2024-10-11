import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_config.dart';
import 'package:ghajar_app/ui/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('ar')],
    path: 'assets/translation',
    child: const ProviderScope(
      child: GhajarApp(),
    ),
  ));
}

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
          locale: Locale('ar'),
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
