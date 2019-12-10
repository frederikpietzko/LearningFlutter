import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  Widget buildContainer() {
    return Container(
      color: Colors.grey[300],
      height: 24.0,
      width: 100.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        ),
        Divider(
          height: 5.0,
        ),
      ],
    );
  }
}
