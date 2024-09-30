import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderWidget<T> extends ConsumerWidget {
  const FutureProviderWidget({
    super.key,
    required this.provider,
    required this.builder,
  });

  final FutureProvider<T> provider;
  final Widget Function(BuildContext context, T data) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(provider).when<Widget>(
          data: (T data) {
            return builder(context, data);
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
