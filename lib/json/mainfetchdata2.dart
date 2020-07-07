import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Sample API with JSON response

class MainFetchData2 extends StatefulWidget {
  @override
  _MainFetchData2State createState() => _MainFetchData2State();
}

class _MainFetchData2State extends State<MainFetchData2> {

  String stringResponse;
  List listResponse;
  Map mapResponse;
  List listOfFacts;

  Future fetchData() async {
    http.Response response;
    response = await http.get('http://thegrowingdeveloper.org/apiview?id=2&type=application/json');
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        listOfFacts = mapResponse['facts'];
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
        body: 
          mapResponse==null ? Container():
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(mapResponse['category'].toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Image.network(listOfFacts[index]['image_url']),
                          Text(listOfFacts[index]['title'].toString(),
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(listOfFacts[index]['description'].toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: listOfFacts==null ? 0: listOfFacts.length,
                  ),
                ],
              ),
            ),
        
      );

  }
}

