import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/store.dart';
import 'package:flutter_ecommerce/models/cart.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:flutter_ecommerce/utils/routes.dart';
import 'package:flutter_ecommerce/widgets/home_widgets/product_header.dart';
import 'package:flutter_ecommerce/widgets/home_widgets/product_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "http://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    leadData();
  }

  leadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final productJson =
    //     await rootBundle.loadString("assets/files/product.json");
    final response = await http.get(Uri.parse(url));
    final productJson = response.body;

    //print(productJson);
    final decodedData = jsonDecode(productJson);
    //print(decodedData);
    var productsData = decodedData["products"];
    //print(productsData);
    ProductModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    //final dummyList = List.generate(20, (index) => ProductModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.gray200,
          size: 23,
          count: _cart!.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeader(),
              if (ProductModel.items.isNotEmpty)
                ProductList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

/* ListView.builder replaced by  GridView.builder
ListView.builder(
                //itemCount: ProductModel.items.length,
                itemCount: ProductModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    //item: ProductModel.items[index],
                    item: ProductModel.items[index],
                  );
                },
              )
*/

/* Before Velocity X
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
        // ignore: unnecessary_null_comparison
        child: (ProductModel.items != null && ProductModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = ProductModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: Image.network(
                        item.image,
                        fit: BoxFit.cover,
                      ),
                      footer: Text(item.price.toString()),
                    ),
                  );
                },
                itemCount: ProductModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),

*/
