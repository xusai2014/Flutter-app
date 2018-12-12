import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FirstState();
  }
}

class FirstState extends State<MyFirst> {
  List _fruit = ["Apple", "Banana", "mango"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetItems(_fruit);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetItems(List _fruit) {
    List<DropdownMenuItem<String>> items = new List();
    for (String f in _fruit) {
      items.add(new DropdownMenuItem(value: f, child: new Text(f)));
    }
    return items;
  }

  void changeItems(String current) {
    setState(() {
      _selectedFruit = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new FirstCon(
          selectedFruit: _selectedFruit,
          dropDownMenuItems: _dropDownMenuItems,
          changeItems: changeItems),
    );
  }
}

class FirstCon extends StatelessWidget {
  FirstCon({
    Key key,
    @required this.selectedFruit,
    @required this.dropDownMenuItems,
    @required this.changeItems,
  }) : super(key: key);

  final String selectedFruit;
  final List<DropdownMenuItem<String>> dropDownMenuItems;
  final Function changeItems;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("下拉彩"),
      ),
      body: new Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(200),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("请选择水果"),
            new DropdownButton(
                value: this.selectedFruit,
                items: this.dropDownMenuItems,
                onChanged:this.changeItems)
          ],
        ),
      ),
    );
  }
}