import 'package:flutter/material.dart';
import './stories_controller.dart';
export './stories_controller.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesController storiesController;

  StoriesProvider({Key key, Widget child})
      : storiesController = StoriesController(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static StoriesController of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoriesProvider)
            as StoriesProvider)
        .storiesController;
  }
}
