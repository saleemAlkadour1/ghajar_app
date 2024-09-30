import 'package:flutter/material.dart';
import 'package:ghajar_app/utils/extensions/color.dart';
import 'package:ghajar_app/utils/extensions/material_theme_mode.dart';
import 'package:ghajar_app/utils/extensions/string.dart';

enum SocialMediaIconEnum {
  google('google'),
  instagram('instagram'),
  telegram('telegram'),
  youtube('youtube'),
  facebook('facebook'),
  facebookCircled('facebook-circled'),
  googleMaps('google-maps'),
  linkedIn('linkedIn'),
  reddit('reddit'),
  snapchat('snapchat'),
  tikTok('tikTok'),
  tinder('tinder'),
  tumblr('tumblr'),
  twitter('twitter'),
  whatsApp('whatsApp'),
  none(null),
  // pinterest,
  // discord,
  // twitch,
  // spotify,
  // appleMusic,
  // soundcloud,
  ;

  String get pathLight {
    if (this == none) {
      return 'assets/images/social-media/share.png';
    }
    return 'assets/images/social-media/$name.png';
  }

  String get pathDark {
    if (this == none) {
      return 'assets/images/social-media/darkShare.png';
    }
    return 'assets/images/social-media/dark${name.ucFirst}.png';
  }

  final String? key;

  const SocialMediaIconEnum(this.key);

  String pathByMode(ThemeMode mode) {
    if (mode.isLight) {
      return pathDark;
    }
    return pathLight;
  }

  String get name => toString().split('.').last;

  static SocialMediaIconEnum defaultStatus() => none;

  static SocialMediaIconEnum from(Object param) {
    return SocialMediaIconEnum.values.singleWhere(
        (SocialMediaIconEnum element) {
      return element.key == param ||
          element.name == param.toString().toLowerCase() ||
          element.index == param;
    }, orElse: () => SocialMediaIconEnum.defaultStatus());
  }

  Color get color {
    return HexColor.fromHex(cssColor);
  }

  String get title {
    switch (this) {
      case SocialMediaIconEnum.instagram:
        return 'Instagram';
      case SocialMediaIconEnum.google:
        return 'Google';
      case SocialMediaIconEnum.telegram:
        return 'Telegram';
      case SocialMediaIconEnum.youtube:
        return 'YouTube';
      case SocialMediaIconEnum.facebook:
        return 'Facebook';
      case SocialMediaIconEnum.facebookCircled:
        return 'Facebook Circled';
      case SocialMediaIconEnum.googleMaps:
        return 'Google Maps';
      case SocialMediaIconEnum.linkedIn:
        return 'LinkedIn';
      case SocialMediaIconEnum.reddit:
        return 'Reddit';
      case SocialMediaIconEnum.snapchat:
        return 'Snapchat';
      case SocialMediaIconEnum.tikTok:
        return 'TikTok';
      case SocialMediaIconEnum.tinder:
        return 'Tinder';
      case SocialMediaIconEnum.tumblr:
        return 'Tumblr';
      case SocialMediaIconEnum.twitter:
        return 'Twitter';
      case SocialMediaIconEnum.whatsApp:
        return 'WhatsApp';
      case SocialMediaIconEnum.none:
        return '';
    }
  }

  String get cssColor {
    switch (this) {
      case SocialMediaIconEnum.instagram:
        return '#DA4088';
      case SocialMediaIconEnum.google:
        return '#DB4437';
      case SocialMediaIconEnum.telegram:
        return '#0088cc';
      case SocialMediaIconEnum.youtube:
        return '#FF0000';
      case SocialMediaIconEnum.facebook:
      case SocialMediaIconEnum.facebookCircled:
        return '#3b5998';
      case SocialMediaIconEnum.googleMaps:
        return '#4285F4';
      case SocialMediaIconEnum.linkedIn:
        return '#0077B5';
      case SocialMediaIconEnum.reddit:
        return '#FF4500';
      case SocialMediaIconEnum.snapchat:
        return '#FFFC00';
      case SocialMediaIconEnum.tikTok:
        return '#000000';
      case SocialMediaIconEnum.tinder:
        return '#FF6B6B';
      case SocialMediaIconEnum.tumblr:
        return '#35465C';
      case SocialMediaIconEnum.twitter:
        return '#1DA1F2';
      case SocialMediaIconEnum.whatsApp:
        return '#25D366';
      case SocialMediaIconEnum.none:
        return '#FFF';
    }
  }
}
