import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:flutter_ecommerce/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '/widgets/drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Wilders";

  @override
  void initState() {
    super.initState();
    leadData();
  }

  leadData() async {
    await Future.delayed(Duration(seconds: 2));
    final productJson =
        await rootBundle.loadString("assets/files/product.json");
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
    //final dummyList = List.generate(20, (index) => ProductModel.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeader(),
              if (ProductModel.items != null && ProductModel.items.isNotEmpty)
                ProductList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Wilder Shop App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Current trend".text.xl2.make(),
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.items.length,
      itemBuilder: (context, index) {
        final product = ProductModel.items[index];
        return ProductItem(product: product);
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Item product;

  const ProductItem({Key? key, required this.product})
      // ignore: unnecessary_null_comparison
      : assert(product != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          ProductImage(
            image: product.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              product.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              product.desc.text.textStyle(context.captionStyle!).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${product.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make(),
                  ),
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
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
