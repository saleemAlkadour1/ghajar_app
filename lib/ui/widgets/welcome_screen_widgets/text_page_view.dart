import 'package:flutter/material.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/text_page_view_item.dart';

class TextPageView extends StatelessWidget {
  const TextPageView({
    super.key,
    required this.titles,
    required this.details,
    this.controller,
  });

  final PageController? controller;
  final List<String> titles;
  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return TextsPageViewItem(
          title: titles[index],
          details: details[index],
        );
      },
      itemCount: titles.length,
    );
  }
}
