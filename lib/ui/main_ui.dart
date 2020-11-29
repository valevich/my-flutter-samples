import 'package:flutter/material.dart';
import 'package:flutter_samples/main.dart';
import 'package:flutter_samples/ui/list1.dart';
import 'package:flutter_samples/ui/list2.dart';
import 'package:flutter_samples/ui/login1.dart';
import 'package:flutter_samples/ui/profile1.dart';

class MainUI extends StatefulWidget {
  @override
  MainUIState createState() {
    return new MainUIState();
  }
}

class MainUIState extends State<MainUI> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Examples"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "List1 Places",
              actionTap: () {
                onButtonTap(List1());
              },
            ),
            MyMenuButton(
              title: "List2 Schools",
              actionTap: () {
                onButtonTap(List2());
              },
            ),
            MyMenuButton(
              title: "Login Screen 1",
              actionTap: () {
                onButtonTap(Login1());
              },
            ),
            MyMenuButton(
              title: "Profile Screen 1",
              actionTap: () {
                onButtonTap(Profile1());
              },
            ),
            // MyMenuButton(
            //   title: "JSON Read Example 3",
            //   actionTap: () {
            //     onButtonTap(MainFetchData3());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Filter JSON",
            //   actionTap: () {
            //     onButtonTap(JsonExample1());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
