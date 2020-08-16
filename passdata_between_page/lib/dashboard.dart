import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final data;
  Dashboard(this.data);
  @override
  _DashboardState createState() => _DashboardState(this.data);
}

class _DashboardState extends State<Dashboard> {
  var data;
  _DashboardState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        children: <Widget>[
          Text(data['name']),
          Text(data['phone']),
        ],
      ),
    );
  }
}
