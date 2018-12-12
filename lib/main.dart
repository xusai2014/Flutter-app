import 'package:flutter/material.dart';
import 'package:myflutterapp/Demo.dart';
import 'package:myflutterapp/First.dart';

void main() => runApp(Routers());

class Routers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'MyFlutterAPP',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
        '/':(_)=> new MyHomePage(title: 'MyHome'), //Jerry's saying: if you have define '/',you should not define home: new MyHome
        '/first':(_)=> new MyFirst(),
      },
    );
  }

}











