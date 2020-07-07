import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Sample API with Search in JSON response

class MainFetchData3 extends StatefulWidget {
  @override
  _MainFetchData3State createState() => _MainFetchData3State();
}

class _MainFetchData3State extends State<MainFetchData3> {
  String stringResponse;
  List listResponse;
  Map mapResponse;
  List listOfFacts;

  Future fetchData() async {
    http.Response response;
    response =
        await http.get('https://extendsclass.com/api/json-storage/bin/febebeb');
    // response = await http.get('https://next.json-generator.com/api/json/get/Vk2vQGb2d');
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        listOfFacts = mapResponse['facts'];

        // List<Map> data = jsonDecode(response.body);
        // for (Map jsonObject in data) {
        //   //This is how you get a value from a Map.
        //   String x = jsonObject["category"];
        //   print (x);
        //   if (jsonObject["category"] == "Facts by The Growing Developer ft Developer Singh"){
        //       print("ID is 1.");
        //   } else {
        //       print("ID is NOT 1.");
        //   }
        // }
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data JSON"),
      ),
      body: mapResponse == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    mapResponse['facts'].toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              listOfFacts[index]['name'].toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              listOfFacts[index]['description'].toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                  ),
                ],
              ),
            ),
    );
  }
}
