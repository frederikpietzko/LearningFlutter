import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert' show json;
import './models/image_model.dart';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    setState(() {
      counter += 1;
    });
    var url = "https://jsonplaceholder.typicode.com/photos/$counter";
    var res = await get(url);
    var imageModel = ImageModel.fromJson(json.decode(res.body));
    setState(() => images.add(imageModel));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s see some pics!'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 50,
          ),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
