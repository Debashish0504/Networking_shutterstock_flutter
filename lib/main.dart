import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_demo/widgets/imagesList.dart';

void main() => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Networking",
      home: ImagesList()
    );
  }

}
