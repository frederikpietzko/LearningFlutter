import 'package:flutter/material.dart';
import '../controllers/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  @override
  Widget build(BuildContext context) {
    final storiesController = StoriesProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await storiesController.clearCache();
        await storiesController.fetchTopIds();
      },
    );
  }
}
