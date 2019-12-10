import 'package:flutter/material.dart';
import '../controllers/stories_provider.dart';
import '../widget/news_list_tile.dart';
import '../widget/refresh.dart';

class NewsList extends StatelessWidget {
  Widget buildList(StoriesController storiesController) {
    return StreamBuilder(
      stream: storiesController.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) => NewsListTile(
              itemId: snapshot.data[index],
            ),
          ),
        );
      },
    );
  }

  Widget build(context) {
    final storiesController = StoriesProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
      ),
      body: buildList(storiesController),
    );
  }
}
