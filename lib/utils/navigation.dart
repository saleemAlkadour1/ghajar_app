import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'enums/app_pages_route.dart';

abstract class AppPageRoute {
  String get route;

  Map<String, String?> get args;
}

class AppNav {
  static GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Main Navigator');
  late BuildContext _context;
  late dynamic _page;
  bool _rootNavigator = true;
  ValueChanged<dynamic>? _onPop;
  String? _route;

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static BuildContext? get currentContext => _navigatorKey.currentContext;

  AppNav(BuildContext context, dynamic page, {ValueChanged<dynamic>? onPop}) {
    _context = context;
    _page = page;
    _onPop = onPop;
  }

  AppNav.withRootRoute(BuildContext context, String route, {ValueChanged<dynamic>? onPop}) {
    _context = context;
    _route = route;
    _onPop = onPop;
  }

  AppNav.withoutRootRoute(BuildContext context, dynamic page, {ValueChanged<dynamic>? onPop}) {
    _context = context;
    _page = page;
    _onPop = onPop;
    _rootNavigator = false;
  }

  AppNav.withoutRoot(BuildContext context, dynamic page, {ValueChanged<dynamic>? onPop}) {
    _context = context;
    _page = page;
    _onPop = onPop;
    _rootNavigator = false;
  }

  AppNav.pop(BuildContext context, {dynamic result, void Function(AppNav appNav)? computation}) {
    _context = context;
    Navigator.of(context).pop(result);
    if (computation != null) {
      computation(this);
    }
  }

  AppNav.popToFirst(BuildContext context) {
    Navigator.of(context).popUntil((Route route) {
      return route.isFirst;
    });
  }

  AppNav.popUntil(BuildContext context, AppPageRouteEnum pageRoute,
      [AppPageRouteEnum? pageRoute2]) {
    final NavigationHistoryObserver observer = NavigationHistoryObserver();
    final history2 = observer.history;
    final iterable = history2.map((p0) => p0.settings.name);

    bool result = false;
    if (iterable.contains(pageRoute.routeName)) {
      Navigator.of(context).popUntil((Route route) {
        result = route.settings.name == pageRoute.routeName;
        return result;
      });
    }

    if (pageRoute2 != null && iterable.contains(pageRoute2.routeName)) {
      Navigator.of(context).popUntil((Route route) {
        result = route.settings.name == pageRoute2.routeName;
        return result;
      });
    }

    if (!result) {
      Navigator.of(context).pop();
    }
  }

  AppNav isNotRoot() {
    _rootNavigator = false;
    return this;
  }

  AppNav page(dynamic value) {
    _page = value;
    return this;
  }

  Future<void> pushPage() async {
    assert(_page != null);
    final response = await Navigator.of(_context, rootNavigator: _rootNavigator).push(
      MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: _page!.route, arguments: _page!.args),
        builder: (BuildContext context) {
          return _page!;
        },
      ),
    );
    if (_onPop != null) {
      _onPop!(response);
    }
  }

  Future<void> pushNamed() async {
    assert(_route != null && _route != '');
    final response = await Navigator.of(_context, rootNavigator: _rootNavigator).pushNamed(_route!);
    if (_onPop != null) {
      _onPop!(response);
    }
  }

  Future<void> pushReplacementNamed() async {
    assert(_route != null && _route != '');
    dynamic res;
    res = await Navigator.of(_context, rootNavigator: _rootNavigator).pushReplacementNamed(_route!);
    if (_onPop != null) {
      _onPop!(res);
    }
  }

  Future<void> pushReplacementPage() async {
    assert(_page != null);
    final response = await Navigator.of(_context, rootNavigator: _rootNavigator).pushReplacement(
      MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: _page!.route, arguments: _page!.args),
        builder: (BuildContext context) => _page!,
      ),
    );
    if (_onPop != null) {
      _onPop!(response);
    }
  }

  Future<void> pushAndRemoveUntilPage() async {
    assert(_page != null);
    final response = await Navigator.of(_context, rootNavigator: _rootNavigator).pushAndRemoveUntil(
      MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: _page!.route, arguments: _page!.args),
        builder: (BuildContext context) => _page!,
      ),
      (Route<dynamic> route) => false,
    );
    if (_onPop != null) {
      _onPop!(response);
    }
  }

  Future<void> pushCupertinoPage() async {
    assert(_page != null);
    final response = await Navigator.of(_context, rootNavigator: _rootNavigator).push(
      CupertinoPageRoute<dynamic>(
        settings: RouteSettings(name: _page!.route, arguments: _page!.args),
        builder: (BuildContext context) => _page!,
      ),
    );
    if (_onPop != null) {
      _onPop!(response);
    }
  }

  Future<void> pushAndReplaceCupertinoPage() {
    assert(_page != null && _onPop == null);
    return Navigator.of(_context, rootNavigator: _rootNavigator).pushReplacement(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) => _page!,
      ),
    );
  }

  Future<void> pushAndRemoveUntilCupertinoPage() {
    assert(_page != null && _onPop == null);
    return Navigator.of(_context, rootNavigator: _rootNavigator).pushAndRemoveUntil(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) => _page!,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static Future<bool> makePhoneCall(String phoneNumber) async {
    bool result = await canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
    if (!result) {
      return false;
    }
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    return await launchUrl(launchUri);
  }

  // Todo: 2023-05-15 - 8:46 p.m. Don't use it. Check next version of url_launcher
  // https://stackoverflow.com/questions/76244218/flutter-url-launcher-plugin-throws-java-lang-illegalargumentexception-receiver
  static Future<bool> openUrl(String url) async {
    bool isValid = await canLaunchUrlString(url);
    if (isValid) {
      final uri = Uri.parse(url);
      return await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw Exception('Could not launch');
    }
  }

  static Future<bool> openUri(Uri uri) async {
    bool isValid = await canLaunchUrl(uri);
    if (isValid) {
      return await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw Exception('Could not launch');
    }
  }

  // Todo: 2023-08-26 - 11:09 a.m. - Add webViewConfiguration to params
  static Future<bool> openUrlExternally(String url) async {
    bool isValid = await canLaunchUrlString(url);
    if (isValid) {
      return await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw Exception('Could not launch');
    }
  }

  // Todo: 2023-05-15 - 8:46 p.m. Don't use it. Check next version of url_launcher
  // https://stackoverflow.com/questions/76244218/flutter-url-launcher-plugin-throws-java-lang-illegalargumentexception-receiver
  static Future<bool> openUrlInAppWebView(String url) async {
    bool isValid = await canLaunchUrlString(url);
    if (isValid) {
      return await launchUrlString(
        url,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: false,
          headers: <String, String>{'my_header_key': 'my_header_value'},
        ),
      );
    } else {
      throw Exception('Could not launch');
    }
  }

  static Future<bool> openAppWithUniversalLinkIos(String url) async {
    try {
      const launchMode = LaunchMode.externalNonBrowserApplication;
      final bool isSucceeded = await launchUrlString(url, mode: launchMode);

      if (!isSucceeded) {
        return await launchUrlString(url, mode: LaunchMode.inAppWebView);
      }
      return isSucceeded;
    } catch (e) {
      throw Exception('Could not launch');
    }
  }

  static Future<bool> appCanOpenUrl(String url) async {
    final uri = Uri.parse(url);
    return await canLaunchUrl(uri);
  }

  /// Don't use this method directly. To do that use [MyApp.reset(context);].
  static restartTheApp() {
    _navigatorKey = GlobalKey(debugLabel: "Main Navigator");
  }
}
