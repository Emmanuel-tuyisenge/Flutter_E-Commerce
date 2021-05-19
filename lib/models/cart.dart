import 'package:flutter_ecommerce/models/products.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //Product field
  ProductModel? _product;

  //Collection of ids - store ids of each item
  final List<int> _itemIds = [];

  //Get product
  ProductModel get product => _product!;

  set product(ProductModel newProduct) {
    assert(newProduct != null);
    _product = newProduct;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _product!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
