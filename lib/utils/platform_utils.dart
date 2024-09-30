import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformUtils {
  static Brightness _brightness = Brightness.light;
  final BuildContext _context;
  late bool _isRtl;
  late String _currentLocaleKey;
  late TextDirection _direction;

  bool get isRtl => _isRtl;

  String get currentLocaleKey => _currentLocaleKey;

  TextDirection get direction => _direction;

  PlatformUtils(this._context) {
    final String lngTag = Localizations.localeOf(_context).toLanguageTag();
    _isRtl = (lngTag.length > 2 ? lngTag.substring(0, 2) : lngTag) == 'ar';
    _direction = _isRtl ? TextDirection.rtl : TextDirection.ltr;
    _currentLocaleKey = lngTag;
    _brightness = Theme.of(_context).brightness;
  }

  /// Get the locale of the host platform
  ///
  /// Because dart:io package doesn't work on the web,
  /// the default local for the web is always the [fallbackLocaleCode]
  static String localeCode = kIsWeb ? 'ar' : Platform.localeName.substring(0, 2);

  static TextDirection dir = localeCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  /// Check if the host platform's locale exists in supported app languages
  static bool get localeIsSupported {
    // only for testing purposes
    int count = 1;
    return count >= 0;
  }

  static Brightness get brightness => _brightness;
}
