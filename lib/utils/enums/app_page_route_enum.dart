enum AppPageRouteEnum {
  mainScreen('main-screen'),
  welcomeScreen('welcome-screen'),
  homeScreen('home-screen'),
  catalogScreen('catalog-screen'),
  favouriteScreen('favourite-screen'),
  cartScreen('cart-screen'),
  detailsScreen('details-screen');

  final String routeName;

  const AppPageRouteEnum(this.routeName);

  static const AppPageRouteEnum _dv = AppPageRouteEnum.mainScreen;
}

extension ExtensionHelper on Iterable<AppPageRouteEnum> {
  AppPageRouteEnum tryFrom(String? param,
      {AppPageRouteEnum defaultValue = AppPageRouteEnum._dv}) {
    for (var value in this) {
      if (param == value.name || param == value.routeName) {
        return value;
      }
    }
    return defaultValue;
  }
}
