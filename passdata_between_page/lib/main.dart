import 'package:flutter/material.dart';
import 'package:passdata_between_page/dashboard.dart';

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
  List contactList = [
    {
      "name": "Devondra",
      "phone": "+7 (675) 771-2390",
    },
    {
      "name": "Myrtle",
      "phone": "+86 (970) 387-0451",
    },
    {
      "name": "Conn",
      "phone": "+52 (352) 319-1099",
    },
    {
      "name": "Abby",
      "phone": "+86 (200) 148-5882",
    },
    {
      "name": "Ag",
      "phone": "+86 (339) 653-2263",
    },
    {
      "name": "Julee",
      "phone": "+62 (577) 903-9752",
    },
    {
      "name": "Dolores",
      "phone": "+33 (635) 286-0788",
    },
    {
      "name": "Malvin",
      "phone": "+420 (782) 310-2268",
    },
    {
      "name": "Torie",
      "phone": "+237 (688) 209-3242",
    },
    {
      "name": "Osmund",
      "phone": "+58 (880) 888-0335",
    },
    {
      "name": "Cristi",
      "phone": "+86 (747) 749-6607",
    },
    {
      "name": "Carine",
      "phone": "+86 (676) 646-8386",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parse Data between page"),
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text(contactList[index]['name'][0]),
                ),
                title: Text(contactList[index]['name']),
                subtitle: Text(contactList[index]['phone']),
                onTap: () {
                  print(contactList[index]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(contactList[index])));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
