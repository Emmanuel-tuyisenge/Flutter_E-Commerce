import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:flutter_ecommerce/widgets/item_widget.dart';
import '/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Wilders";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => ProductModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "E-Commerce App",
          //style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          //itemCount: ProductModel.items.length,
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              //item: ProductModel.items[index],
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
