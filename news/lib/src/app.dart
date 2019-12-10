import 'package:flutter/material.dart';
import './controllers/stories_provider.dart';
import './controllers/comments_provider.dart';
import './screens/news_detail.dart';
import './screens/news_list.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'Hacker News',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) {
        final storiesController = StoriesProvider.of(context);
        storiesController.fetchTopIds();
        return NewsList();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        final itemId = int.parse(settings.name.replaceFirst('/', ''));
        final commentsController = CommentsProvider.of(context);
        commentsController.fetchItemWithComments(itemId);
        return NewsDetail(itemId: itemId);
      });
    }
  }
}
