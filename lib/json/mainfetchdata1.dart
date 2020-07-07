import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Sample API with List Response

class MainFetchData1 extends StatefulWidget {
  @override
  _MainFetchData1State createState() => _MainFetchData1State();
}

class _MainFetchData1State extends State<MainFetchData1> {
  String stringResponse;
  List listResponse;

  Future fetchData() async {
    http.Response response;
    // response = await http.get('http://thegrowingdeveloper.org/apiview?id=4&type=application/json');
    response =
        await http.get('https://extendsclass.com/api/json-storage/bin/ecdabdc');
    if (response.statusCode == 200) {
      setState(() {
        listResponse = jsonDecode(response.body);
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
      body: listResponse == null
          ? Container()
          : Text(
              listResponse[2].toString(),
              style: TextStyle(fontSize: 30),
            ),
    );
  }
}
