import 'package:flutter_ecommerce/models/cart.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  ProductModel? product;
  CartModel? cart;

  MyStore() {
    product = ProductModel();
    cart = CartModel();
    cart!.product = product!;
  }
}
