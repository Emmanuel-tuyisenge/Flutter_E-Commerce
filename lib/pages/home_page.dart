import 'package:flutter/material.dart';
import '/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Wilders";

    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce App"),
      ),
      body: Center(
        child: Container(
          child: Text("Hello $days $name !"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
