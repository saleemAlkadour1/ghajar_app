enum PlatformOS {
  linux,
  macos,
  windows,
  android,
  ios,
  fuchsia,
  web,
}

extension PlatformOSHelper<T extends PlatformOS> on Iterable<T> {
  Map<String, PlatformOS> asTitles() {
    return <String, PlatformOS>{for (var value in this) value.title: value};
  }

  tryFrom(String? param, {PlatformOS defaultStatus = PlatformOS.web}) {
    for (var value in this) {
      if (value.name == param) {
        return value;
      }
    }
    return defaultStatus;
  }
}

extension PlatformOSExtension on PlatformOS {
  int get id {
    return index + 1;
  }

  String get title {
    switch (this) {
      case PlatformOS.android:
        return 'Android';
      case PlatformOS.ios:
        return 'IOS';
      case PlatformOS.windows:
        return 'Windows';
      case PlatformOS.linux:
        return 'Linux';
      case PlatformOS.macos:
        return 'MacOS';
      case PlatformOS.fuchsia:
        return 'Fuchsia';
      case PlatformOS.web:
        return 'Web';
      default:
        return name;
    }
  }

  toTitledMap() {
    return {id: title};
  }
}
