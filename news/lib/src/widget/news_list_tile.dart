import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../controllers/stories_provider.dart';
import './loading_container.dart';
import 'dart:async';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget build(context) {
    final storiesConroller = StoriesProvider.of(context);
    storiesConroller.fetchItem(itemId);
    return StreamBuilder(
      stream: storiesConroller.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }
            return buildTile(itemSnapshot.data, context);
          },
        );
      },
    );
  }

  Widget buildTile(ItemModel item, BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(item.title),
          subtitle: Text("${item.score} votes"),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.comment),
              Text("${item.descendants}"),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, "/${item.id}");
          },
        ),
        Divider(
          height: 5.0,
        ),
      ],
    );
  }
}
