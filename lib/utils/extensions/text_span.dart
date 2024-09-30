import 'package:flutter/widgets.dart';

extension TextSpanSpaceInListItemsExtension on List<InlineSpan> {
  List<InlineSpan> addSpaceBetweenItems() {
    return map((e) => [e, const TextSpan(text: ' ')]).expand((e) => e).toList();
  }
}
