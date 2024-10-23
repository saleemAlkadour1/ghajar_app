import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/page_view_item.dart';

class CustomPageView extends ConsumerWidget {
  const CustomPageView({
    super.key,
    required this.pathImages,
    required this.titles,
    required this.details,
    required this.pageController,
  });

  final PageController? pageController;
  final List<String> titles;
  final List<String> details;
  final List<String> pathImages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return PageViewItem(
          pathImage: pathImages[index],
          title: titles[index],
          details: details[index],
        );
      },
      itemCount: titles.length,
    );
  }
}
