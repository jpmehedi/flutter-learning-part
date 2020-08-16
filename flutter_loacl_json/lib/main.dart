import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Parse Local Json Data',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data;

  Future<String> loadJsonData() async {
    var jsonData = await rootBundle.loadString('assets/data.json');
    setState(() {
      data = json.decode(jsonData);
    });
    print(data);
    return "Success";
  }

  @override
  void initState() {
    this.loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parse Local Jason"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text(data[index]['name'][0]),
                ),
                title: Text(data[index]['name']),
                subtitle: Text(data[index]['email']),
              )
            ],
          );
        },
      ),
    );
  }
}
