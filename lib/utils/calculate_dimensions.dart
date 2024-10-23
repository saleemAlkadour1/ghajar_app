import 'package:get/get.dart';
import 'package:ghajar_app/app/app_config.dart';

double heightScreen = Get.size.height;
double widthScreen = Get.size.width;

double width(x) {
  return x * widthScreen / AppConfig.designSize.width;
}

double height(x) {
  return x * heightScreen / AppConfig.designSize.height;
}

double emp(x) {
  var r = ((x * heightScreen / AppConfig.designSize.height) +
          (x * widthScreen / AppConfig.designSize.width)) /
      2;
  return r;
}

double adjustTextSize(String text, double defaultFontSize, int maxCharacters) {
  double scaleFactor = 1.0;
  if (text.length > maxCharacters) {
    scaleFactor = maxCharacters / text.length;
  }
  return defaultFontSize * scaleFactor;
}
