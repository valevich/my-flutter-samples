import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example2 extends StatefulWidget {
  Example2();

  final String title = "Managing Favorites";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/managingFavoritesInSharedPreferences";

  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  final List<String> meals = new List();
  final List<String> favs = new List();

  @override
  initState() {
    super.initState();
    setUp();
    if (favs.isEmpty) {
      SharedPreferences.getInstance().then((prefs) {
        if (prefs.getStringList("favs") != null) {
          favs.addAll(prefs.getStringList("favs"));
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites Example"),
      ),
      body: Container(
        child: ListView.builder(
            // Let the ListView know how many items it needs to build
            itemCount: meals.length,
            // Provide a builder function.
            itemBuilder: (context, index) {
              String meal = meals[index];
              return ListTile(
                title: new Text(meal),
                trailing: Icon(
                    isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
                onTap: () {
                  setState(() {
                    addRemFavorite(meal);
                  });
                },
              );
            }),
      ),
    );
  }

  void setUp() {
    meals.add("Pizza");
    meals.add("Spaghetti");
    meals.add("Lasagne");
    meals.add("Steak");
    meals.add("French Fries");
    meals.add("Mac & Cheese");
    meals.add("Schnitzel");
    meals.add("Brezel");
  }

  bool isFavorite(String meal) {
    return favs.contains(meal);
  }

  void addRemFavorite(String meal) async {
    if (favs.contains(meal)) {
      favs.remove(meal);
    } else {
      favs.add(meal);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favs", favs);
  }
}
