import 'package:flutter/material.dart';
import 'package:passdata_between_page/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Parse Data between page',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List posts;

  Future<bool> _getPost() async {
    String postURL = "https://jsonplaceholder.typicode.com/posts";
    try {
      var response = await http.get(postURL);
      setState(() {
        posts = json.decode(response.body.toString());
      });
    } catch (e) {
      print(e);
    }

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parse Data between page"),
      ),
      body: ListView.builder(
        itemCount: posts.length == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text('Title: ${posts[index]['title']}'),
                subtitle: Text('Description: ${posts[index]['body']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(posts[index]),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
