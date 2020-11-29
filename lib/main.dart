import 'package:flutter/material.dart';
import 'package:flutter_samples/animations/main_animations.dart';
import 'package:flutter_samples/app_clone/main_apps_clone.dart';
import 'package:flutter_samples/appbar_sliverappbar/main_appbar_sliverappbar.dart';
import 'package:flutter_samples/collapsing_toolbar/main_collapsing_toolbar.dart';
import 'package:flutter_samples/communication_widgets/main_communication_widgets.dart';
import 'package:flutter_samples/hero_animations/main_hero_animations.dart';
import 'package:flutter_samples/json/main_json.dart';
import 'package:flutter_samples/managingFavoritesInSharedPreferences/Example2.dart';
import 'package:flutter_samples/managingInputsWithinModalBottomsheet/Example3.dart';
import 'package:flutter_samples/menu_navigations/main_menu_navigations.dart';
import 'package:flutter_samples/persistent_tabbar/main_persistent_tabbar.dart';
import 'package:flutter_samples/scroll_controller/main_scroll_controller.dart';
import 'package:flutter_samples/size_and_position/main_size_and_position.dart';
import 'package:flutter_samples/split_image/main_split_image.dart';
import 'package:flutter_samples/ui/main_ui.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Samples"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyGroupButton(
              title: "Fetch Data JSON",
              actionTap: () {
                onButtonTap(
                  MainJson(),
                );
              },
            ),
            MyGroupButton(
              title: "UI Examples",
              actionTap: () {
                onButtonTap(
                  MainUI(),
                );
              },
            ),
            MyGroupButton(
              title: "ScrollController and ScrollNotification",
              actionTap: () {
                onButtonTap(
                  MainScrollController(),
                );
              },
            ),
            MyGroupButton(
              title: "Apps Clone",
              actionTap: () {
                onButtonTap(
                  MainAppsClone(),
                );
              },
            ),
            MyGroupButton(
              title: "Animations",
              actionTap: () {
                onButtonTap(
                  MainAnimations(),
                );
              },
            ),
            MyGroupButton(
              title: "Custom AppBar & SliverAppBar",
              actionTap: () {
                onButtonTap(MainAppBarSliverAppBar());
              },
            ),
            MyGroupButton(
              title: "Menu Navigations",
              actionTap: () {
                onButtonTap(MainMenuNavigations());
              },
            ),
            MyMenuButton(
                title: "Persistent Tab Bar",
                actionTap: () {
                  onButtonTap(
                    MainPersistentTabBar(),
                  );
                }),
            MyMenuButton(
              title: "Collapsing Toolbar",
              actionTap: () {
                onButtonTap(
                  MainCollapsingToolbar(),
                );
              },
            ),
            MyMenuButton(
              title: "Hero Animations",
              actionTap: () {
                onButtonTap(
                  MainHeroAnimationsPage(),
                );
              },
            ),
            MyMenuButton(
              title: "Size and Positions",
              actionTap: () {
                onButtonTap(
                  MainSizeAndPosition(),
                );
              },
            ),
            MyMenuButton(
              title: "Communication Widgets",
              actionTap: () {
                onButtonTap(
                  MainCommunicationWidgets(),
                );
              },
            ),
            MyMenuButton(
              title: "Split Image",
              actionTap: () {
                onButtonTap(MainSplitImage());
              },
            ),
            MyMenuButton(
              title: "Save Favorites",
              actionTap: () {
                onButtonTap(Example2());
              },
            ),
            MyMenuButton(
              title: "Checkboxes Radiobuttons",
              actionTap: () {
                onButtonTap(Example3());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback actionTap;

  MyMenuButton({this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: actionTap,
      ),
    );
  }
}

class MyGroupButton extends StatelessWidget {
  final String title;
  final VoidCallback actionTap;

  MyGroupButton({this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Colors.blueGrey,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: actionTap,
      ),
    );
  }
}
