import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/store.dart';
import 'package:flutter_ecommerce/models/cart.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item product;
  AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);
  //final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    //final ProductModel? _product = (VxState.store as MyStore).product;
    bool isAdded = _cart!.items.contains(product);
    return ElevatedButton(
      onPressed: () {
        if (!isAdded) {
          isAdded = isAdded.toggle();
          //final _product = ProductModel();

          //_cart.product = _product!;
          //_cart.add(product);
          AddMutation(product);
          //setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isAdded ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
