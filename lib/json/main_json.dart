import 'package:flutter/material.dart';
import 'package:flutter_samples/json/fetch_data/main_fetch_data.dart';
import 'package:flutter_samples/json/filterList/JsonExample1.dart';
import 'package:flutter_samples/json/mainfetchdata1.dart';
import 'package:flutter_samples/json/mainfetchdata2.dart';
import 'package:flutter_samples/json/mainfetchdata3.dart';
import 'package:flutter_samples/json/mainfetchdata4.dart';
import 'package:flutter_samples/main.dart';

class MainJson extends StatefulWidget {
  @override
  MainJsonState createState() {
    return new MainJsonState();
  }
}

class MainJsonState extends State<MainJson> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Examples"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "MainFetchData",
              actionTap: () {
                onButtonTap(MainFetchData());
              },
            ),
            MyMenuButton(
              title: "JSON Read Example 1",
              actionTap: () {
                onButtonTap(MainFetchData1());
              },
            ),
            MyMenuButton(
              title: "JSON Read Example 2",
              actionTap: () {
                onButtonTap(MainFetchData2());
              },
            ),
            MyMenuButton(
              title: "JSON Read Example 3",
              actionTap: () {
                onButtonTap(MainFetchData3());
              },
            ),
            MyMenuButton(
              title: "JSON Read Example 4",
              actionTap: () {
                onButtonTap(MainFetchData4());
              },
            ),
            MyMenuButton(
              title: "Filter JSON",
              actionTap: () {
                onButtonTap(JsonExample1());
              },
            ),
          ],
        ),
      ),
    );
  }
}
