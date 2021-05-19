import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/home_detail_page.dart';
import 'package:flutter_ecommerce/widgets/themes.dart';
import '../home_widgets/product_image.dart';
import 'package:velocity_x/velocity_x.dart';
import '/models/products.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.items.length,
      itemBuilder: (context, index) {
        final product = ProductModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                product: product,
              ),
            ),
          ),
          child: ProductItem(product: product),
        );
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
          Hero(
            tag: Key(product.id.toString()),
            child: ProductImage(
              image: product.image,
            ),
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
