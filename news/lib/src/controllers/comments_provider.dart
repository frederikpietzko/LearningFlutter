import 'package:flutter/material.dart';
import './comments_controller.dart';
export './comments_controller.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsController commentsController;

  CommentsProvider({Key key, Widget child})
      : commentsController = CommentsController(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CommentsController of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CommentsProvider)
              as CommentsProvider)
          .commentsController;
}
