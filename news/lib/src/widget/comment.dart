import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item_model.dart';
import 'package:html_unescape/html_unescape.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  Widget build(context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return Text("Still loading comment");
        }
        final children = <Widget>[
          ListTile(
            title: buildText(snapshot.data),
            subtitle: snapshot.data.by == ""
                ? Text("[deleted]")
                : Text(snapshot.data.by),
            contentPadding: EdgeInsets.only(
              right: 16.0,
              left: depth * 16.0,
            ),
          ),
          Divider(),
        ];
        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth + 1,
            ),
          );
        });
        return Column(children: children);
      },
    );
  }

  Widget buildText(ItemModel item) {
    final unescape = HtmlUnescape();
    final text = unescape.convert(item.text);
    return Text(text);
  }
}
